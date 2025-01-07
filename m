Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775C8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Az2wVx1hCiPjzJ0BVL12MlXicctDopMjOkqCsQ4N3kk=; b=4XYp318XDGsWqu/CWs+F5fObR3
	xdOLZHrEgfic4penRAZ0K0tSA7CRB3A+Bq8Uvq3Qm6758L9TWs31a6QeAo6UKGoP1y5WZcK3AR5C2
	+3bSzjN3O7ongcGjcfrNHwJ27OP2cQGxBtPGmAchQaX14ERX1L8CT17ihDRyZ3oOzfQGtWmjxDYIA
	yA3h/lO7LMeRSsHvshmQrLYSRFYRLWcuNp5n0rRak9twDk8sNhvJ+8nlTrDAVN0hDmgaSaDG3MWfR
	slN5OhbZGgBrXYnbg4BceCop6Z4/U8NhSvLJI3B47SpSQD1pVCosBdXsV9el5osO2KLRpKccVRzQc
	NSvImRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB69-00000005LPz-15OS;
	Tue, 07 Jan 2025 15:02:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB2A-00000005Kh2-0waj;
	Tue, 07 Jan 2025 14:58:19 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaedd529ba1so1756722066b.1;
        Tue, 07 Jan 2025 06:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736261896; x=1736866696; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Az2wVx1hCiPjzJ0BVL12MlXicctDopMjOkqCsQ4N3kk=;
        b=mOy9X0De0bnasJrrCmRZE+itycW6bcIC04AK0m3TCu9pRiBWW3ZYczc4JGcrenfMF/
         er1nsJGMmbItQQ1AXEuNBmVAsmM29oY25sXH8gNQafAJaTiH6rK6KNfSsnhJ/NlQIvxP
         YbruzGUmJ4KrCEmLjNV2ZkxEKBAiSFP6fdqXwlEGZjTuMqquaKt/zs6FsaQTKY+yUjck
         WdQZ8nea11ahCx7wt1CJm9VBeIeaEpuHH35kTlG/w3woXsd2oDsCu+42ipWoycfGD01V
         U1UNUN8j8i/y4XVn28Px/K36euKE+xUq6LTaDU5Spu57A8jRdyugUSFm/8MCel2olXKF
         fp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736261896; x=1736866696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Az2wVx1hCiPjzJ0BVL12MlXicctDopMjOkqCsQ4N3kk=;
        b=eV2hW7TBZ6V+Ht67wnNxMnRHSKEmuxnRPPb4Yh0WDuOnpm3hAoAzmDsPTS40UCgaSx
         r49Z7bIzMDfB30Tp0DEQmAzTDrAijEt41Pa9pwST58tHvDuCP5/RZOedDxnqpOcx9dom
         7NIgFKEferj/Q4urZnkGxTvl6ZzL7NsNmFZBS/joo5iN0JnzorLC6LhG+QGT6LGl+7oF
         SVLqDEf0F+WoMmqIKm5ZCN89kucHEZ4SpqoMOhIJ8z/c1xzsAeIgVSDp6FhT+x/bCkA/
         UdkCJcUy17j7eTiQI/lOa6o4WIC5t5z6k3BOeztCSaiWnWO5cKzdXVDVXxQSnLR/ZpOp
         qj/g==
X-Forwarded-Encrypted: i=1; AJvYcCUgT2NJ1/jEXaqhAH5sYGZNJG1AWjf8t9Cni03Y/1Oxy3Ym7Y+McmSH8rCWNYp4h7b7WHBdlO+tWDzjB2mxPfM=@lists.infradead.org, AJvYcCVGf+zsRSDIczTeN6nY8GY0jUA8OyJ4DyDTnBWDz7i3FcKbQhKt1CuAkt27/sHw8PlIgnV6v8UHivzGm46XunGE@lists.infradead.org
X-Gm-Message-State: AOJu0YzVCAig5cBdFt3MRlwXLm+m/mOEOGEWHZfEDlsWRmVQcS+f6KSv
	+fINwiZ00JeeEt124Dbn0N41+utOxzRRg+bQWwduJ9iCGKOO9Jo6NXie0ese/heP1iOprg1y5Gp
	dMJkoTyaSDPJoR0Kn//aqZBGqWF0=
X-Gm-Gg: ASbGncugU8WQ2JbWNi4vPp06yC0LwQ2T+nwa/Gt38QwNBzi2OhiNzcXvnvL0/Nq346P
	vmGvOW/hE6x88i7Ovge7E3cKY7SsviXT6pM3XVg==
X-Google-Smtp-Source: AGHT+IHo/aaG2IRziYHWgdJTI7LpsNtYnkQPqpLDzk81p5lbFEu3We9AunbvRFqyiMLdOxqwHKgstcmD7QIW7IPgedI=
X-Received: by 2002:a05:6402:1588:b0:5d3:ba42:e9e3 with SMTP id
 4fb4d7f45d1cf-5d81dd9ce81mr153578555a12.13.1736261896167; Tue, 07 Jan 2025
 06:58:16 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <5a3e8fda-f9e4-4c2f-847b-93f521b8313b@lunn.ch> <CANAwSgSUuEvJb2Vn58o0i7Soo3jGzM8EYHvDtUTPxRHekCpruA@mail.gmail.com>
 <c94570db-c0af-4d92-935c-5cc242356818@lunn.ch> <CANAwSgQ_gojVxvi_OyHTyTSdzRrno=Yymn0AdEXyTHTgDTyFcA@mail.gmail.com>
 <Z3vGXrUIII4ixNnF@ryzen> <b49e6147-32c6-4239-bdba-72f25ef04a9f@lunn.ch>
 <CANAwSgQqPREeFQisQZXqB52+w+j54Bwq4RMiHf3qUTXmnTxCAw@mail.gmail.com> <c08f3d69-1f3d-49a6-96ac-0c2f990f9a8d@lunn.ch>
In-Reply-To: <c08f3d69-1f3d-49a6-96ac-0c2f990f9a8d@lunn.ch>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 7 Jan 2025 20:27:58 +0530
Message-ID: <CANAwSgTWXBhhDk4Yq3U8qTTRBUOx24MvM7moWoKFkKU8Nn6eAw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Andrew Lunn <andrew@lunn.ch>
Cc: Niklas Cassel <cassel@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_065818_260114_097AA777 
X-CRM114-Status: GOOD (  17.18  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Andrew

On Tue, 7 Jan 2025 at 18:43, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I was just trying to understand the call trace for mdio bus which got
> > me confused.
> >
> > [0] https://lore.kernel.org/all/Z3fKkTSFFcU9gQLg@ryzen/
>
> There is nothing particularly unusual in there. We see PCI bus
> enumeration has found a device and bound a driver to it. The driver
> has instantiated an MDIO bus, which has scanned the MDIO bus and found
> a PHY. The phylib core then tried to load the kernel module needed to
> drive the PHY.
>
> Just because it is a PCI device does not mean firmware has to control
> all the hardware. Linux has no problems controlling all this, and it
> saves reinventing the wheel in firmware, avoids firmware bugs, and
> allows new features to be added etc.
>
>         Andrew

Thanks for clarifying.

-Anand


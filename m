Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A4C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEo++tWNX66vRUCbHgrcE/DoABgbXtbHvpdUx5myUAQ=; b=4vwE9Fssxc1dnsjPLepb0ulUbh
	nSh9lHJ170I19ozABefoDOFCSyDbf9IyhsyAUdYIFf/jy65/HIKqLEF4kSaAxpPnaHFFBebP87NG1
	tI/C/Cwf7Hw9wL8joqtL9GvhvKaOfrCao7suFywuxyzL2XtxggREav9VlHZDiroT7SlXFxYHXBEjB
	HM35xv6ZormlUOQNMHPiHXSmuxkC0jHCmoYyZOPOuEzDEx8yW3ybZp48hvXPLmHyMrWvd5aUh05eq
	D2PwOMqcMN0kqPNEQaP6lmO4PwCvXsGaWDVAoD+r6DO5TR/TIoc5CGg5ZDvu+R3E+BG/bcXi8TF2h
	LLu6Lhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrArk-00000001Nk9-290T;
	Tue, 04 Aug 2026 08:51:16 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrArh-00000001NiR-0vJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 08:51:14 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoZ5ZO8OZBZ/iUpI+eZEd/Lqj8ue+EOuXFtMfUkfYkRDjkVhK2XPDgodIHR1us3q2B2cxktfCFhq8bot7i6JMoi@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785833467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LEo++tWNX66vRUCbHgrcE/DoABgbXtbHvpdUx5myUAQ=;
	b=Ga/lUyyeKuAkuPsXpea6EwrOg+/sKoTtiA3RnaAFyJcax/GPMQlIzrT207SVm31wf5LGA7
	aDOXkDCmDMPv3wAeHzAvv1THw7iiL4jo8WVWBcOZ7PcWOxuGYm7Av4fY6+FUE2lvaLGMKM
	i6g8t9fGufhFJi3d5h4ZdTzVHRzOXRM=
X-Gm-Message-State: AOJu0YxYAHAfw1eSOdotGNmlJKJE6TDsPTZR3bKYD526v49uhgh9CuoW
	feVXk0jH5qPUm2axDvpiuy5ayiRj7PidJ8gma9oHO2zf6RexD6k5NmD5AxqB30B0D50M2DdbfqD
	C1iSn6EwFQbiaOMn2h0b4WouinC2M6V0XYVmIKjLE
X-Received: by 2002:a05:622a:1649:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-52cd5150f2cmr10989531cf.11.1785833444348; Tue, 04 Aug 2026
 01:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260803124220.332248-1-fuad.tabba@linux.dev> <20260803124220.332248-11-fuad.tabba@linux.dev>
 <86qzkfaxp9.wl-maz@kernel.org> <CA+EHjTw1=xCPugZrmQ3nj1ddvCZ=vcZT3=KO_FMHB1USUTu7kA@mail.gmail.com>
 <86pkzyb7bn.wl-maz@kernel.org>
In-Reply-To: <86pkzyb7bn.wl-maz@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 4 Aug 2026 09:50:07 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyY+8-Cv1=dHg=4fbmOjtvA6+aY4yqV5uY2ev=uGJHEKQ@mail.gmail.com>
X-Gm-Features: AUfX_mxuF3k7WlOHdukcbNyPC8gFg_R9mHxire5WFqvzPcz3vuSQrFTruIYyFdQ
Message-ID: <CA+EHjTyY+8-Cv1=dHg=4fbmOjtvA6+aY4yqV5uY2ev=uGJHEKQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] KVM: arm64: nVHE: Check hypercall handlers
 against the declared ABI
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, alexandru.elisei@arm.com, 
	vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	ardb@kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_015113_540905_CA23DD25 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

Hi Marc,

On Tue, 4 Aug 2026 at 09:47, Marc Zyngier <maz@kernel.org> wrote:
> > I'm happy to respin with both of these, or would you like to fold them in?
>
> Oliver is in charge of 7.3, so I'll let him reply on this.

I'll respin in that case, make life easier for Oliver, since he
doesn't have them applied and they do conflict slightly with patch 11.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


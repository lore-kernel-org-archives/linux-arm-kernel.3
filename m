Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205F5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/tm/wcnr6fTaffyLAXSgHwJaQbGmdxPhc9rTLVd32w=; b=3WevokBSkVgfz3BiiZ1XCoNjVq
	EB2vPtpjCmBf5DL3SKsnt4XvsdAueeEz8l95hmWqBUDCil8KtrlgmdevlPmnCxEcqtLWiNVxAo54u
	jHfiVxIuKoMe9U/Zzmo98u+6kFGBfNDPK1P+qi9h9+S1c30+JYpVolRpyFR9hIaxw2sdORzkqpJIk
	x16RTqJCVch/7H4LFuGocRUntB//Kwf72bATH7zjxnG6xdofLs/U/jE9gFN22DU6dQ/FnzEK//bny
	kUXXM0qiAzvN6kpuEBftlrFzrc0uPCAw1cVJWQX/gjQImMrw3TXVj+6LaPFaw/VzCg0qGkoMtHX4g
	XdytZoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz5p-0000000BOeC-0uDR;
	Tue, 10 Dec 2024 12:11:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz4m-0000000BOSI-2jOf;
	Tue, 10 Dec 2024 12:10:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434a1fe2b43so55801205e9.2;
        Tue, 10 Dec 2024 04:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733832651; x=1734437451; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f/tm/wcnr6fTaffyLAXSgHwJaQbGmdxPhc9rTLVd32w=;
        b=lwoLWZCVTw6enASNYrZ+KDKJELy+SUBodggvzJmvTOf+7Cy3u/j0RQ+xJ2cefjn9Qf
         8M7kYUEtxuDTyn5dkLjkjUKpq9pPLOSXr3q02+g4V3b4WCqkYvtv+RGaEmypuEzNcKSA
         p4tnWqBSXEx/dGA1c6RZ4YdAIL4wtJkv7Bf/rhxiXDjpxgSNd82xx3dyrWPlwGrDesCx
         DRECJsLP0XF3xKHexpwviGeBKXxLxyMVGdXWvenm0HLrTOYYGTzMXMkTv29yMT252BIj
         fdOLJT54iLKvbYeIp6+uYOk5o0VYv8O6UTLjSqRspZoxTYlMaChvhq4ETyughhfurQzs
         t9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733832651; x=1734437451;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/tm/wcnr6fTaffyLAXSgHwJaQbGmdxPhc9rTLVd32w=;
        b=CXee+VuZAkW7V9Ns3hqQwyFnhfUqtnlFXEAtTFS3GMqZhm62G6HOH1SB0EgHIh6h8j
         IqUKYzGUUnvWJ9hJUbvMtCj6GRgC3XqzsXna0LfvbIiPo228h6wcsMyJtUNb7RAjUZue
         ikAyua/4OEXm3in+88npJj/jmHMrCUrHg/WMtk55Zi8tPN/rHsCanwc4MTBhkA4X2TyP
         ImV8gcDA5uPHARz6bgOGx4yzmxM4Ag0qxz7/1G31c7Oip+j+zIr+lUoBertNXPLSEpMs
         OyIVokoZiin3xblKaAQQ2xfQuff2BqJZgGtFxjobbemlgN3dRMBrfxe3ouXUMCX+xGF0
         vZIg==
X-Forwarded-Encrypted: i=1; AJvYcCVa94yHEd/m1JNfw+wRPvU45WUMyE5SEkImYZ01SWPEfbwdF9erUsVSyU7C/3J6/6aeRuhSnm1rwwdNvGb6DGA=@lists.infradead.org, AJvYcCWOK8J3YRq8hcuP66muuLWcIIMcJOQyP3fU6eh+8ER6JIsI96W4SefOOfl9IhE8UY+g1cwvhCYnm9BZmipu9v+x@lists.infradead.org
X-Gm-Message-State: AOJu0Ywha4kG1uEKEigYJlTwIgwkvXwBOFmf2OBEb5mCWC0zugxMOcN2
	iPJFRrMFYyKKjs4s6IUBHm33EmFxK+wyjoOpaCLyaAZVAI4y8rEq
X-Gm-Gg: ASbGnctg6uAZtxhTmm3/yPbqgO1XW8x9lMB9TNpEvJomYy1+Usb1MmQ13hDi0dXA7Nl
	kwrMtltuX6RqA9pUOh/q0f6QefrLDc4ZbZ5/Q2BeZEOr1uHO9ha6dF8llYr24W384lE7y13AEi6
	2qNMErqNPHB1QanUZKckmdBxRFyKcFF+aP8gkPvC2aRVd9eu/HkVXuM9ldRK1UAM0wtC9izTYUJ
	llcYOdwCVfFk0aypC+/ZwVPu80lG/ZGhPPJOA4EBZPZVBVtXyk3ZsOnj+nDqu7xPKTmB8YgTvcs
	nj3EaKtZTQ==
X-Google-Smtp-Source: AGHT+IELqnqj7Lv40ZEePpA0AiZtjlj0HSeZm+v8CN5Y+7SYlmGGorQ4+fRTjI1MBtElPDrqJtCp+A==
X-Received: by 2002:a05:600c:3b03:b0:435:14d:f61a with SMTP id 5b1f17b1804b1-435014dfa8emr28638915e9.25.1733832650610;
        Tue, 10 Dec 2024 04:10:50 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f1125e69sm107925285e9.32.2024.12.10.04.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 04:10:50 -0800 (PST)
Message-ID: <67582fca.050a0220.2d187a.9e01@mx.google.com>
X-Google-Original-Message-ID: <Z1gvxWn-xvCByaUb@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 13:10:45 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 9/9] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-10-ansuelsmth@gmail.com>
 <b3b79c80-ac7c-456b-a3b5-eee61f671694@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3b79c80-ac7c-456b-a3b5-eee61f671694@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_041052_685768_41DE898A 
X-CRM114-Status: GOOD (  16.09  )
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

On Tue, Dec 10, 2024 at 02:36:29AM +0100, Andrew Lunn wrote:
> > +config AIR_AN8855_PHY
> > +	tristate "Airoha AN8855 Internal Gigabit PHY"
> > +	help
> > +	  Currently supports the internal Airoha AN8855 Switch PHY.
> > +
> >  config AIR_EN8811H_PHY
> >  	tristate "Airoha EN8811H 2.5 Gigabit PHY"
> >  	help
> 
> Do you have any idea why the new one is AN, and previous one is EN?  I
> just like consistent naming, or an explanation why it is not
> consistent.
>

EN EcoNet that was then absorbed by Airoha (AN). Hence it's the same
thing. Airoha is suggesting to use AN for new submission. So it's just
about timing.

> > +#define AN8855_PHY_ID				0xc0ff0410
> > +static struct phy_driver an8855_driver[] = {
> > +{
> > +	PHY_ID_MATCH_EXACT(AN8855_PHY_ID),
> 
> Is there any documentation about the ID, and the lower nibble. Given
> it is 0, i'm wondering if PHY_ID_MATCH_EXACT() is correct.
>

I will check this but I doubt there is any explaination. These are internal
to the switch so my theory is that no exact logic was applied.

-- 
	Ansuel


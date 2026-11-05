Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B17606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EZMHrpZN;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=6b0Y4SfD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UJCvvH2LVzLLKKiKlCpu1moOiFoxJyhCDFLz6en74v0=; b=EZMHrpZNmLdGKuYFBPnLmAwmrg
	RDv32rOFzY1yMUmUoGX9DvK9GFzLHzdVcPPkNWEGSlZL0wSfm7bKZz9yIHxYDufeVByPi4Dn40NBL
	K7SdSARF7JI80ySYd76bQqs0kGGN/HeO248ZYNF11ytfX1RUuENrnGbg49UOVQm3Cbo3C0GLnC5tx
	bBbgimVUuJ4NaxZjiWiFGgkRw3GyJH0EYPr85YKjIl89BDSQhhoIEvVxAVIpx9qiNZvxqpoZ/z47U
	11zff4J8LIQVkzi/xPndZa4s+JAZj+TAyrdGkNLo0n9xlA7B3fQpbB6WB0fn9/rSnR5axr8LGMyLU
	AvShE+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy6e-00000009DBa-3dmN;
	Thu, 05 Nov 2026 14:06:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy6c-00000009DB2-2iGo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:06:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso14466635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 06:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793887576; x=1794492376; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UJCvvH2LVzLLKKiKlCpu1moOiFoxJyhCDFLz6en74v0=;
        b=6b0Y4SfD9TnRzzTX27+6TAXKZ0hN3+CBf2nTVW5Os34LV+igQjqbDJGd8ODiu4IaaR
         heisI/mtJ4fZ8vPVHnhw+o8mo7stpPZcDExa9oxI+S6nZkeLiQ+qN0i7bbGq2GoksBRr
         +j+Eo+9SV6LQs2ZI/jb94fkaR/KYZIPEUHuAikQy6oX7Q4g9SadDlXvYfzg1sn8c5lan
         7v0ukeFAbmk98BIyW1XEHwqlMyPUp4/qfvHVeLx1PoB3m3y/4/fiiWK60KERzfRnfXgq
         574oGnKPC8W1eF8WHcOJKJOMv6MXnvXTv6ESmZwNQAxGCBGXOjw7VnCBSUoFRxmQbtKA
         uw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887576; x=1794492376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJCvvH2LVzLLKKiKlCpu1moOiFoxJyhCDFLz6en74v0=;
        b=nROqmvTkUd+1UQDmUr14SxaPvcSpgJned0m8P6Jm3rS2qEuZhdhwwJa6yO4ZK7b4Y6
         rT/Wz3Hm1F1s2DKeqfWxpjrXN7FLVXNcLpblATTT0+JcdXx0ngkmS4rO/50H/iO6A8q9
         QejdWrbYPEvP6ViG/JUEHFnt6rUHJqWEFtQirT3AJxR0eZjL6t+NAgpEgMyM8hVRXElt
         IU74bBKOoqRVE7WwOg+XwSzkImHuZSxCDmRoHNLx/SM3IHPqLzbw0Mlarw26bJ71dOtl
         PZS7tTCBtk70wbPRhnEdeJCpxuS/E8C0cRQcyUURTCBR1vVWAcYx/LFm+mnx7jsYttkX
         dhHw==
X-Forwarded-Encrypted: i=1; AKwUvBzmtEa+C9aeGwMNiyExn2Z1nKRfgZvp8W/m01pWhXj6/syuYCJj38wBXO7+6kSDVlm03lYb0j9h3KL5CZeeUmGT@lists.infradead.org
X-Gm-Message-State: APuU4Z/Lfs8Zz69cGmGl2DwXalE/CpWwdO7OoLoK6CX0d9MUerHjTkFK
	QUa1yaIiggYgiBtie7DBHvvB478Ig8uW74iiLhpT5hkGpurZOGpL61ACRg8CoYPd60w=
X-Gm-Gg: AYBFou22nMuHVQjpha5A1Hdr2aFE7Z0Tt/BEpjPDA8slTKbirWlu08YvNmtowPhT76z
	vjWkWp5pjSHe4KUZPTA94Zu1kqsOoduZOmmrCWgtvTgVmXkT2yFVHUVopJsLRWisdttLdfNZUzd
	6kfNCKqV+UyiMVn/wUqnmbDYMNAgNC5wVybJ4M979LO5VLk+iMAjwy2VgOdx7FhtQ+OGiX7Li44
	T7EnL6uy4E+GC2Fw8RSqFci9UjqtJ1QuFMCGSk3ypCRXJl8KDEt5s7BBhQS40EAydCzOkg3wVak
	eNoh4sFKbflkUZz6EcSKXqUw+TqjF2ulQvPO7xXnE5z5U/sKmNvXfpwWATbNdJe9Nyr+jmbBl5o
	wHoS9srUAgVUxFLkO8fYN5X0LPZN4fqtlhfeUFU/aqdI0gBGUfIsxd2JwFf+oZb9aF+YS+eybG/
	F6znyY9YegV2QNqnSVDIqClWh0rmHtEpg1Ss0cEfj7mFCBGD2zFc5YWaGmRJeocEuxhtXAThuS5
	iWm9h2PHl4Lg3VOnoYTFaPOMa/QCQ5lPs1qkVda8u0JnwS2HE2IIsaBypUM7MVHnxGUrwIUCDnH
	e2JaYpqaBToiPaeH5x2RIPGjN1a4hWSQinJTwQHd/+OrxHM4iPqRkift50Qw5j+wMhwUXtVT3Dr
	BDADC22m/v0NTMoonSfeqy/n5KXiAEgVrRrcwZqNDy/sTC2Np5/pOJcU5CldfbfkFH4JmG/8zsI
	Ykf+TIxiO21NGo
X-Received: by 2002:a05:600c:83c5:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ac17191017mr399753615e9.8.1793887575774;
        Thu, 05 Nov 2026 06:06:15 -0800 (PST)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm59048765e9.4.2026.11.05.06.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:15 -0800 (PST)
Date: Thu, 5 Nov 2026 14:06:12 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, richardcochran@gmail.com,
	p.zabel@pengutronix.de, peppe.cavallaro@st.com,
	joabreu@synopsys.com, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net: stmmac: support the TC9564 SoC
Message-ID: <auyNVNo2I_Xunxi-@aspen.lan>
References: <20261019030129.1470307-1-elder@riscstar.com>
 <20261019030129.1470307-6-elder@riscstar.com>
 <3d0b17c6-3b94-4e36-b7bc-700211c83273@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d0b17c6-3b94-4e36-b7bc-700211c83273@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_060618_783087_4E5F85C2 
X-CRM114-Status: GOOD (  17.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime

Actually, this might be more for Alex to find when he works through the
review feedback but...


On Mon, Oct 19, 2026 at 09:52:58AM +0200, Maxime Chevallier wrote:
> > +static struct tc9564_mac_speed mac_speed[] = {
> > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_2500BASEX },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_100,   SP_SEL_SGMII_100M },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_10,    SP_SEL_SGMII_10M },
> > +};
> <snip>
> > +static int tc9564_mac_speed_select(struct tc9564_data *td,
> > +				   phy_interface_t interface, int speed)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(mac_speed); i++) {
> > +		if (mac_speed[i].phy_interface != interface)
> > +			continue;
> > +
> > +		if (speed == mac_speed[i].speed || speed == SPEED_UNKNOWN)
> > +			return mac_speed[i].sp_sel;
> > +	}
> > +	dev_err(td->dev, "%s/%d unsupported\n", phy_modes(interface), speed);
>
> Is that "mac_speed" lookup table actually needed ? maybe a simpler switch/case
> based on the speed alone would be enough, or do we really need to validate
> the phy_interface_t each time ?

Once we add 10G PHY support I don't think it can be based on link speed
alone (for 10G PHY we have to write the same value to SP_SEL regardless
of link speed).

However even when that happens we could still code it up using switch/case
and ifs.


Daniel.


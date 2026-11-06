Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D7A606EEBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hUEw52hQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NlKD8YVJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+KjFRIlwc0fQgpSaiqKXkBqkuri5Ko/sHn1nPO0owQo=; b=hUEw52hQ5su4/sHiTpew+Lhdq4
	CecDSBM90EwUF41TxkOu/HilEtx4TEHiOJMkRSokspF8sWwKOOGyBUJcsT1VbB7QcimD1mQOPtiVE
	ny40VDtUjufZwclRwwSWmQTI+KclKnZveii3mdhGfaZHa35meDRwQwZ12NQYamEiWNPQ1523ZBf7/
	YqkKZKI3OwxAw+LM33gUSs7gYLp6WISzyrJ8k+pv9OPyErn4tJAtiLrwCvzVo1JSNQuufDvpdgwGJ
	iMaCCM7Elahr5OKEE3EvJHd4/HhYbYbM9tGLs5KE899Ayc6/MAlwAEjGgh8LVJ2UUTAdApFOul3Kt
	TBLBA59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIlA-0000000CGtV-2T1c;
	Fri, 06 Nov 2026 12:09:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIl7-0000000CGsI-2pZY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:09:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so5687245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966967; x=1794571767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KjFRIlwc0fQgpSaiqKXkBqkuri5Ko/sHn1nPO0owQo=;
        b=NlKD8YVJj7tHIS4FvfaI0q/W5jZLUOy1T5T/8jsbTBDc+wpzusFQ5KQkkvq29ADW/G
         N9YOA2sdxsViJBGP58Kobfa7GPZG2tG+o/Yw7s5DJJratjV2wcWehnOXU+4rd6PPoUl7
         kmnmZ+tglgaAtP4n/t++UhftsF3PWUehNCfL4btI01kJED+uHlGqVKXQ1jvmSXmFFdt/
         Z6jTQ+/Be78JeAoVwPjfKD4X6HvDq8NFyDzNCmNXDQrNlAhw7TjWfKabGptAifEVxVem
         s3q/Y3UU9WaJF/ZObIHeC89bKHV/v6GErYM/U0dxpExQhHjR4MGH9KLZZOMto8K8wrbx
         2IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966967; x=1794571767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KjFRIlwc0fQgpSaiqKXkBqkuri5Ko/sHn1nPO0owQo=;
        b=TzALGHyD/a8rEuDW6rqWmm49SsYxxiIN8p26olIXsq2h/xjOurQg+dZZ7QCeI/9kVp
         AJ1bJJgv2q9sr4aON0QlcwLkDR5cl1D2sgNEUcNheFGVQaYhUd72tH/bAMHKsUgw6fSn
         QraadYA4T/8lkzn2sjZV7DzidFCiixD1pBUEG78PdF5QYScDj4Sn/gcfkTzZ+wimsZ4m
         ITme+MiCkkpPKKsQ+kn0NNSo+uhNulQV3FgyNdM2Be32sD8pcZNM/emC4loXvpjsvsnM
         fMzcfkDgEmrByXs7qYwIcybwqQPFzId6aI7bkSOl7lmMASg7WUgBc+Mj6pLeQJ4UdAHk
         sO8w==
X-Forwarded-Encrypted: i=1; AKwUvBxW387CI9ku3fdzuF466ENy+QyoFASXLB7Xfz48X/p/jWmwLMK31T3PGRIbMPxnUUtTLx+rAIfuFwOh3063LaAK@lists.infradead.org
X-Gm-Message-State: APuU4Z/KyVvNZPtLVZJCXfKGFj/tVGkTEfQdcIQlLkQseoh5OUkPnJhe
	BIejX3ct37vXmzv4/hZS1cHrBfr17ZnF8Wq97Uo5YqoOc3jE9jbrvC0O
X-Gm-Gg: AYBFou2rKAE3asIgow07bdJW+btAtnQ3CowHKlN4ELbSIAFFHrf2ZZ/zpC+cOJW8eV4
	/ZP8OsM6w4lADkCz9HR3z7GDKmsmJqZaXs4eFy02YLUC9DaUTL/LJynkuiiuZSGFSMEPJoM1ycp
	GEE1TA7tLm8EbKymUU+ZQNvyhrsuxjkIlcIv9GnbTJcVCQ7zW8eUzXLbQWNILGIIowOMhA/fkFA
	rvIyqm3bVs6kvETGHw1UuuJP2H+Dap2Ymsft12rNcOQZGLIyDWwtahxHWXt9YqM2phISK8ZV0HK
	tg5EyKBcnAcKGUkSwBjW4L2OGUIQnn5MvYYMXrQNO58uLpCOT7k1BZK4cOCemUTgYkAX9rcPFnG
	tglQ3G34zfoT43s2HnnxuQ8NroWstdKKOrFuI4Ampc3RiYtuJhAlTgDwmUwyXtIbB5pUW/vdwWg
	xnGklzbWxumYX6frElLEEzyS2bsly3QoxLP8aicHjWCHtXdQl4mn8TmEU4ORADOgfg7WfgzUKnz
	9/XcriOVLKjTZWFxOobC2kmVxp6F+6nSbZHzeWOra2sWoda5mml5Z9FqNqBbYd+8q5ivvfM7nIt
	j/M4yIQjwLGM4EUMOlyZnhnUHAYWyvAYKN04BZ1tnURH2hT0xlMItUwj/RwGS/unhp7NhcbSvUa
	vBmDo3E92PFq6Xck=
X-Received: by 2002:a05:600c:64c5:b0:4a7:4697:dae3 with SMTP id 5b1f17b1804b1-4b6dfca2330mr40505405e9.24.1793966967349;
        Fri, 06 Nov 2026 04:09:27 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7233297sm3526249f8f.27.2026.11.06.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:09:26 -0800 (PST)
Message-ID: <6aedc376.79189afa.3a0b25.2405@mx.google.com>
X-Google-Original-Message-ID: <au3DcuM4XQPC-Aus@Ansuel-XPS.>
Date: Fri, 6 Nov 2026 13:09:22 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 5/6] net: phy: mediatek: add calibration
 logic for AN7581
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
 <20261103221439.30502-6-ansuelsmth@gmail.com>
 <028a75a3-b69c-4ae8-8f15-3ef855346a0f@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <028a75a3-b69c-4ae8-8f15-3ef855346a0f@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_040929_745755_B5BA9ECF 
X-CRM114-Status: GOOD (  20.49  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:47:26PM +0100, Andrew Lunn wrote:
> > +static int airoha_cal_cycle(struct phy_device *phydev, int devad,
> > +			    u32 regnum, u16 mask, u16 cal_val)
> > +{
> > +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> > +	struct phy_device *phydev_p0;
> > +	int ret;
> > +
> > +	phydev_p0 = shared->phydev_p0;
> > +
> > +	phy_modify_mmd(phydev, devad, regnum, mask, cal_val);
> > +
> > +	ret = mtk_cal_cycle_wait(phydev_p0);
> 
> 
> > +static int airoha_rext_cal_sw(struct phy_device *phydev)
> > +{
> 
> ...
> 
> > +	phydev_dbg(phydev, "Start REXT SW cal.\n");
> > +	first_calib = airoha_cal_cycle(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_ANA_CAL_RG5,
> > +				       MTK_PHY_RG_REXT_ZCAL_CTRL_MASK, zcal_ctrl);
> > +
> 
> > +static int airoha_cal_sw(struct phy_device *phydev, enum CAL_ITEM cal_item,
> > +			 u8 start_pair, u8 end_pair)
> > +{
> > +	u8 pair_n;
> > +	int ret;
> > +
> > +	for (pair_n = start_pair; pair_n <= end_pair; pair_n++) {
> > +		switch (cal_item) {
> > +		case REXT:
> > +			ret = airoha_rext_cal_sw(phydev);
> > +			break;
> 
> > +static int airoha_start_cal(struct phy_device *phydev, enum CAL_ITEM cal_item,
> > +			    enum CAL_MODE cal_mode, u8 start_pair,
> > +			    u8 end_pair, u32 *buf)
> > +{
> > +	int ret;
> > +
> > +	switch (cal_mode) {
> > +	case SW_M:
> > +		ret = airoha_cal_sw(phydev, cal_item, start_pair, end_pair);
> 
> 
> > +static int airoha_phy_calib(struct phy_device *phydev)
> > +{
> > +	phy_package_lock(phydev);
> > +	if (!shared->rext_sw_calib_done) {
> > +		ret = airoha_start_cal(phydev, REXT, SW_M, NO_PAIR, NO_PAIR, NULL);
> > +		if (ret) {
> > +			phy_package_unlock(phydev);
> > +			return ret;
> > +		}
> > +
> > +		shared->rext_sw_calib_done = true;
> > +	}
> > +	phy_package_unlock(phydev);
> > +
> > +	ret = airoha_start_cal(phydev, TX_R50, SW_M, PAIR_A, PAIR_D, NULL);
> 
> 
> > +static int an7581_phy_config_init(struct phy_device *phydev)
> > +{
> > +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> > +	struct phy_device *phydev_p0;
> > +	u8 phy_offset;
> > +	int oldpage;
> > +	int ret;
> > +
> > +	phydev_p0 = shared->phydev_p0;
> > +	phy_offset = phydev->mdio.addr - phydev_p0->mdio.addr;
> > +
> > +	if (phy_package_init_once(phydev)) {
> > +		ret = an7581_phy_package_config_init_once(phydev);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret = airoha_phy_calib(phydev);
> 
> > @@ -88,6 +1610,7 @@ static struct phy_driver mtk_socphy_driver[] = {
> >  	{
> >  		PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7581),
> >  		.name		= "Airoha AN7581 PHY",
> > +		.config_init	= an7581_phy_config_init,
> 
> > > There are 4 phys in total, only the phy with mdio address 9 has the
> > > calibration capability. Thus only one phy at the time can perform
> > > the calibration sequence.
> 
> config_init -> airoha_phy_calib -> airoha_start_cal -> airoha_cal_sw
> -> airoha_cal_cycle
> 
> I cannot say i looked at all the details closely, maybe i missed an ==
> 9 somewhere, but to me, it looks like two config_init can run in
> parallel.
> 

Hi Andrew, in v5 I converted the driver to full phy_package_lock/unlock and
I set the base address correctly to the hardcoded value of the SoC.

This permitted me to simplify the validation code instead of saving the
phydev for port0 in the phy_package struct (a much solid implementation in
short)

-- 
	Ansuel


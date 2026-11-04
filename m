Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD7606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u29Yf3kG;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=isxIwnt5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3/zRe9vwimyAKlujhJpIykf1rU8WDG4BW3gdKws4SSg=; b=u29Yf3kGGQJXvhAO49HPF3r9gp
	VWcvv4GKhWkHRSJrg6BN4pCSY7d94j5QcmZ5vD46D5XcaSWVRteJpsXyvTLWdn0Iut9tfmQwWCDf+
	B+jB4Bl9F+H+8rnwhSO38fpIwo4AZSxKxCAf2meFiZ6zK4mxtim2N1V03/u+7WEX9ZRDtfZBnNfOG
	J3ezQ9v3rGLMa2mL26QGM1QHZSs7bE6oGXyqwvnXr9TYqtGQmD+6s/Klsf10IUpWyPod2HB8fKGY5
	VlInIgoei2pumqYHAXVKvAbp1q3ZilozvDm8SnVu7011jhu03Jg4IfNRugt9nFvTmfAAbuXTfF8aW
	awlA8MnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVjU-00000004bPF-13uC;
	Wed, 04 Nov 2026 07:48:32 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVjQ-00000004bNu-1eej;
	Wed, 04 Nov 2026 07:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793778509; x=1825314509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MGERo7IutoYDKFk1OSRa5qfbdpb6Z5J0rtb4cbykvQk=;
  b=isxIwnt5oNO34+eSRV81xGsLxBxg/Tga/WKkjl+Iw42OvBLbcVxnetNw
   kwfZkgsGx626mDnO5LXREItjw3oWtx/TCulE4t2+mBwpmniILArC7JjhV
   8w8d89zxzF+4ZE0MYClBr+rBJnZubjG98EqVjcPRStBZknrITuT7FjXkT
   ANmz9MnehLclnK7lUmQ5mXmLK4tA9jNMo5sgQNoNKqriQH7HIzAvwih9B
   3tvXV8D+b/VoaisXRYCwaCJI2+RrxjDEr282Tlto/rMCB6XuiwQnLSmHN
   VCfnwTaN1cSstjY6ZV8dDfh70sxxDud9LBWgFyb/69VkoSS0QBy0lxDkC
   w==;
X-CSE-ConnectionGUID: 6wg+ZjioTvaux0kelHfmdA==
X-CSE-MsgGUID: 81AgWnASSf28QqC0kDMh8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2418893"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2418893"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 23:48:27 -0800
X-CSE-ConnectionGUID: 12yQyZT5RzOj8Mi/HJRdgw==
X-CSE-MsgGUID: btuo50MzQVK+LwpDLUyClw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6966599"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Nov 2026 23:48:25 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 680F399; Wed, 04 Nov 2026 08:48:23 +0100 (CET)
Date: Wed, 4 Nov 2026 08:48:23 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Message-ID: <20261104074823.GA176724@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
 <20261030084750.GP158991@black.igk.intel.com>
 <c93100aad298d4ae1751ec60f037eb903f398658.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c93100aad298d4ae1751ec60f037eb903f398658.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_234829_357059_E8964A11 
X-CRM114-Status: GOOD (  34.17  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Wed, Nov 04, 2026 at 07:34:07AM +0000, Chunfeng Yun (云春峰) wrote:
> > 
> > > +{
> > > +	/*
> > > +	 * avoid device link fail for pcie tunnel
> > > +	 */
> > 
> > What's this? 
> explain why call these functions, without enable pm of nhi->dev,
> tb_acpi_add_link() -> device_link_add() will fail

Do you have the _DSD with the "usb4-host-interface"? tb_acpi_add_link()
should take care of runtime resuming both.

> > And the comment style is not the expected.
> will fix it.
> 
> > 
> > > +	pm_runtime_set_active(nhi->dev);
> > > +	pm_runtime_get_noresume(nhi->dev);
> > > +	devm_pm_runtime_enable(nhi->dev);
> > 
> > This means we never runtime suspend? Then this is not good.
> No, just enable the device's pm and get a count to link pcie/usb4's
> device, and will release later.
> 
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static irqreturn_t nhi_plat_isr(int irq, void *data)
> > > +{
> > > +	struct tb_nhi *nhi = data;
> > 
> > Did you run checkpatch.pl against this? If not please do.
> > 
> > > +	schedule_work(&nhi->interrupt_work);
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +static int nhi_plat_init_irq(struct tb_nhi *nhi)
> > > +{
> > > +	int ret;
> > > +
> > > +	INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
> > > +
> > > +	ret = devm_request_irq(nhi->dev, nhi->irq, nhi_plat_isr,
> > > IRQF_NO_SUSPEND,
> > > +			       dev_name(nhi->dev), nhi);
> > > +	if (ret)
> > > +		return dev_err_probe(nhi->dev, ret, "request irq
> > > failed\n");
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void nhi_plat_exit(struct tb_nhi *nhi)
> > > +{
> > > +	devm_free_irq(nhi->dev, nhi->irq, nhi);
> > > +	flush_work(&nhi->interrupt_work);
> > > +
> > > +	pm_runtime_put_noidle(nhi->dev);
> > > +	pm_runtime_disable(nhi->dev);
> > > +	pm_runtime_set_suspended(nhi->dev);
> > > +}
> > > +
> > > +static const struct tb_nhi_ops nhi_plat_default_ops = {
> > > +	.init = nhi_plat_init,
> > > +	.shutdown = nhi_plat_exit,
> > > +	.init_interrupts = nhi_plat_init_irq,
> > > +};
> > > +
> > > +static int nhi_plat_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct tb_nhi *nhi;
> > > +
> > > +	nhi = devm_kzalloc(dev, sizeof(*nhi), GFP_KERNEL);
> > > +	if (!nhi)
> > > +		return -ENOMEM;
> > > +
> > > +	nhi->dev = dev;
> > > +	nhi->ops = &nhi_plat_default_ops;
> > > +
> > > +	nhi->iobase = devm_platform_ioremap_resource(pdev, 0);
> > > +	if (IS_ERR(nhi->iobase))
> > > +		return PTR_ERR(nhi->iobase);
> > > +
> > > +	nhi->irq = platform_get_irq(pdev, 0);
> > > +	if (nhi->irq < 0)
> > > +		return dev_err_probe(dev, nhi->irq, "get irq
> > > failed\n");
> > > +
> > > +	return nhi_probe(nhi);
> > > +}
> > > +
> > > +static void nhi_plat_do_remove(struct platform_device *pdev, bool
> > > reset)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct tb *tb = platform_get_drvdata(pdev);
> > > +	struct tb_nhi *nhi = tb->nhi;
> > > +
> > > +	/*
> > > +	 * On system shutdown/reboot force a host router reset so
> > > the
> > > +	 * CM asserts DPR on connected tbt3 devices before the
> > > router tree
> > > +	 * is removed (see tb_stop()).
> > > +	 */
> > > +	if (reset)
> > > +		nhi->host_reset = true;
> > > +
> > > +	pm_runtime_get_sync(dev);
> > > +	pm_runtime_dont_use_autosuspend(dev);
> > > +
> > > +	tb_domain_remove(tb);
> > > +	wait_for_completion(&nhi->domain_released);
> > > +	nhi_shutdown(nhi);
> > > +}
> > > +
> > > +static void nhi_plat_remove(struct platform_device *pdev)
> > > +{
> > > +	nhi_plat_do_remove(pdev, false);
> > > +}
> > > +
> > > +static void nhi_plat_shutdown(struct platform_device *pdev)
> > > +{
> > > +	nhi_plat_do_remove(pdev, true);
> > > +}
> > > +
> > > +
> > > +#ifdef CONFIG_OF
> > > +static const struct of_device_id nhi_plat_of_match[] = {
> > > +	{ .compatible = "thunderbolt-platform" },
> > 
> > Not sure if this is correct? Should this have mediatek,... ?
> still need a common one, and also add a mediatek,thunderbolt?
> 
> but the current platform is running on uefi/acpi but not based on dts,
> 
> should I add a dt-binding for it?

Then no, that will be added when there is user for that.

> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, nhi_plat_of_match);
> > > +#endif
> > > +
> > > +#ifdef CONFIG_ACPI
> > > +static const struct acpi_device_id nhi_plat_acpi_match[] = {
> > > +	{ "ACPI0015", 0 },
> > 
> > Same here, where is this ID defined in the ACPI spec?
> see acpi spec release 6.5, section 5.6.7 Device Class-Specific Objects,
> Table 5.205: ACPI Device IDs
> 
> ACPI0015
> USB4 host interface device. See Links to ACPI-Related Documents under
> the heading “USB4 Host Interface Specification”

Okay, I missed that. Then this is fine. Thanks.

> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(acpi, nhi_plat_acpi_match);
> > > +#endif
> > > +
> > > +static struct platform_driver nhi_plat_driver = {
> > > +	.probe = nhi_plat_probe,
> > > +	.remove = nhi_plat_remove,
> > > +	.shutdown = nhi_plat_shutdown,
> > > +	.driver = {
> > > +		.name = "thunderbolt",
> > > +		.of_match_table = of_match_ptr(nhi_plat_of_match),
> > > +		.acpi_match_table = ACPI_PTR(nhi_plat_acpi_match),
> > > +		.pm = &nhi_pm_ops,
> > > +	},
> > > +};
> > > +
> > > +module_platform_driver(nhi_plat_driver);
> > > +MODULE_ALIAS("platform:thunderbolt");
> > > +MODULE_DESCRIPTION("Thunderbolt/USB4 platform host interface
> > > driver");
> > > +MODULE_LICENSE("GPL v2");
> > > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > > index e86845762e22..6dfdc47e05d2 100644
> > > --- a/drivers/thunderbolt/tb.h
> > > +++ b/drivers/thunderbolt/tb.h
> > > @@ -768,8 +768,6 @@ extern const struct device_type
> > > tb_retimer_type;
> > >  extern const struct device_type tb_switch_type;
> > >  extern const struct device_type usb4_port_device_type;
> > >  
> > > -int tb_domain_init(void);
> > > -void tb_domain_exit(void);
> > >  int tb_xdomain_init(void);
> > >  void tb_xdomain_exit(void);
> > >  
> > > diff --git a/include/linux/thunderbolt.h
> > > b/include/linux/thunderbolt.h
> > > index 57502da29080..212c8fea6571 100644
> > > --- a/include/linux/thunderbolt.h
> > > +++ b/include/linux/thunderbolt.h
> > > @@ -532,6 +532,7 @@ struct tb_nhi {
> > >  	u32 *interrupt_mask;
> > >  	bool going_away;
> > >  	bool iommu_dma_protection;
> > > +	int irq;
> > 
> > You are missing kernel-doc.
> will fix it.
> 
> Thanks
> 
> > 
> > >  	struct work_struct interrupt_work;
> > >  	u32 hop_count;
> > >  	unsigned long quirks;
> > > -- 
> > > 2.43.0
> > 
> 


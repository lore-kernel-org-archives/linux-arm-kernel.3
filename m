Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC8FC282DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+h7jsWHv3eIxLPH5dNajezN+xQFTDwe/w8/eZdR268=; b=TqmtI3V/aMvUygZ5irzZ5dS8mp
	9t9F9m+Sj0YmuAHFOz7q71EI7KCkZhwSJRnEeGoFal0PZM9CwU+AxCJ6ZJLEj81iQ8yhE3OA/Lh6N
	HoVX3vhT/G1ccRv+bYrtjJPqMUPD12RlEHmqjWcdJzAFeWLHnwVmdRyIxUpUU536lRBa73cjZqhM2
	pguW4h5lwVN5XMik70m3U0b9QdF3BISiDsRNx1MM+lH2xgSY98TBpaLAHikr0XOsywrDN37DdNVrp
	wNHpmDMbNYdPZ2kAq87R/WGYxUhxdiYBf69zWMupHaUl3m6CJ/6gmcyh0SEKvvtjqrkYbukpTj815
	hlwvvb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpalq-00000006Q26-0czV;
	Tue, 04 Mar 2025 22:29:50 +0000
Received: from smtp-77.smtpout.orange.fr ([80.12.242.77] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZhZ-00000006INB-2gQA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 21:21:23 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pZhEtjoYlf1j1pZhItMWBa; Tue, 04 Mar 2025 22:21:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1741123273;
	bh=K+h7jsWHv3eIxLPH5dNajezN+xQFTDwe/w8/eZdR268=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=F/htZXuHwOLqrOg37Ie4xDkEu5dSoXycvKds+QJgKpHM4TF1OfVT4PgIZuJDeGsrB
	 7qx9+ZmsUoXQ9CxklHemGcceTvS3H7LKNkR9LpBbJPyxeMj4+OhOJVX/dIbM51l0ea
	 mSFuiORCumZyYWbbq5vwhFzOK/bETgw1Bhn9ORtyVf6YLnqItZ94mJAK5qh0IDCT51
	 /Tw545tJjZPj9yLKoj7O2JntYzLwJiLtZvYykbYpMVGXLVw8Lt4yzIapdyNsw6aXKJ
	 6BHl6lQXZd3Ia8praMr/qD7YfmQ0mg6MIWWvafegftXVEwL42f7yq+x1VOGvchNrqC
	 ggVLi8D6df4mQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 04 Mar 2025 22:21:13 +0100
X-ME-IP: 90.11.132.44
Message-ID: <7ef88ec2-24a5-4aa7-a601-d605a12768ba@wanadoo.fr>
Date: Tue, 4 Mar 2025 22:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
To: Kevin Chen <kevin_chen@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, derek.kiernan@amd.com, dragan.cvetic@amd.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250304104434.481429-1-kevin_chen@aspeedtech.com>
 <20250304104434.481429-4-kevin_chen@aspeedtech.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250304104434.481429-4-kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_132122_216495_AEE7B708 
X-CRM114-Status: GOOD (  14.07  )
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

Le 04/03/2025 à 11:44, Kevin Chen a écrit :
> Add LPC PCC controller driver to support POST code capture.
> 
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>

Hi,

> +	init_waitqueue_head(&pcc->wq);
> +
> +	pcc->mdev_id = ida_alloc(&aspeed_pcc_ida, GFP_KERNEL);

Missing ida_free() in therror handling path and in the rmove function?

> +	if (pcc->mdev_id < 0) {
> +		dev_err(dev, "Couldn't allocate ID\n");
> +		return pcc->mdev_id;
> +	}
> +
> +	pcc->mdev.parent = dev;
> +	pcc->mdev.minor = MISC_DYNAMIC_MINOR;
> +	pcc->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME,
> +					pcc->mdev_id);
> +	pcc->mdev.fops = &pcc_fops;
> +	rc = misc_register(&pcc->mdev);
> +	if (rc) {
> +		dev_err(dev, "Couldn't register misc device\n");
> +		goto err_free_kfifo;
> +	}
> +
> +	rc = aspeed_pcc_enable(pcc, dev);
> +	if (rc) {
> +		dev_err(dev, "Couldn't enable PCC\n");
> +		goto err_dereg_mdev;
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, pcc);
> +
> +	return 0;
> +
> +err_dereg_mdev:
> +	misc_deregister(&pcc->mdev);
> +
> +err_free_kfifo:
> +	kfifo_free(&pcc->fifo);
> +
> +	return rc;
> +}
> +
> +static void aspeed_pcc_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct aspeed_pcc_ctrl *pcc = dev_get_drvdata(dev);
> +
> +	kfifo_free(&pcc->fifo);
> +	misc_deregister(&pcc->mdev);
> +}
> +
> +static const struct of_device_id aspeed_pcc_table[] = {
> +	{ .compatible = "aspeed,ast2600-lpc-pcc" },
> +	{ },

Unneeded trailing comma after a terminator.

> +};
> +
> +static struct platform_driver aspeed_pcc_driver = {
> +	.driver = {
> +		.name = "aspeed-pcc",
> +		.of_match_table = aspeed_pcc_table,
> +	},
> +	.probe = aspeed_pcc_probe,
> +	.remove = aspeed_pcc_remove,
> +};

...

CJ


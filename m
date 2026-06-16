Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08364CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmsrwhwGIBGtR6IR/FUQcccER/dBuB3LGdWTVHkvHFU=; b=amgRCvA60lWAXjQyYNS6hwxztt
	euGF5hXAYJbOzfcngNz/EJc8VIYerV6GRtDC8fbATfsuz3aCxocpzgBGtpygdfBrwD68Ei7+HRDdG
	I3yH3LoC5A+8nKQqmkHShoGp0j++7bbN7ArcTdUfncFL04BsoACvq3XacfxW6JVyefggmv+Tt5mGC
	8x/JZHFtCLHWxT4LPnWbhqg//TOUaf0FJoZC11cpPznmw3fpXQQThuHBx9VUzvyhSLLgvNbdvs4zz
	VpsnsH9yG9GmTRgJdK1u5qlnF/sLBOCgLrlztcWTRw14sCQhdLaBaQYOU1rlhgfLo0oHtCPLUIvjz
	wHD+HNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSR6-0000000Fiwl-1ll2;
	Tue, 16 Jun 2026 11:58:32 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSR3-0000000Fivx-0sOX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1781611107;
 bh=HmsrwhwGIBGtR6IR/FUQcccER/dBuB3LGdWTVHkvHFU=;
 b=AXx+lNK7JyAYzQylLVaWsictru/bAQU8zYr8mE6MFxqm7ScCIEtIKKQlgmbtmk9n8GGW8GcvX
 RzJMOWtU0srDaOdZyDQFAPxigHBhlicTYy3XkCktqwf5XcXBGzI+u0h+1NnGMB8wGHQqJwjgSjO
 MbFZkd7IgXMYZeWwsLqvtDJObc8mRFsJOzlwVVha8JnanxRwu86RQDgU6qncskfAHAFXMxAJv+2
 4dj1CGds7IJnLdL4jyWXtkgUKtLzyH1Xav71/PnU0UgzBbmb3MeB/OBdP/S5RCaA/bBxdjlxELf
 uRDlvph5xboMmgrm1xbMWTkVHHcC2yz6Rfdcf1peHHBQ==
X-Forward-Email-ID: 6a313a60428e66688ae5d278
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.28
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Tue, 16 Jun 2026 07:58:23 -0400
Message-Id: <DJAGFE0RORK0.2HXY05SU7H3AF@ubuntu.com>
Subject: Re: [PATCH] soc: apple: sart: require device link for consumers
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260616005346.7862-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260616005346.7862-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_045829_600908_14FD06EA 
X-CRM114-Status: GOOD (  15.89  )
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

On Mon Jun 15, 2026 at 8:53 PM EDT, Pengpeng Hou wrote:
> devm_apple_sart_get() obtains the supplier platform device and attempts
> to create a runtime-PM device link to it, but it ignores device_link_add(=
)
> failure.  A consumer can then continue without the dependency that keeps
> the SART supplier ordered and runtime-PM reachable.
>
> Treat a failed device link as an error and drop the supplier device
> reference before returning.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/soc/apple/sart.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/apple/sart.c b/drivers/soc/apple/sart.c
> index 9eaf3febb382..66b99955b395 100644
> --- a/drivers/soc/apple/sart.c
> +++ b/drivers/soc/apple/sart.c
> @@ -218,6 +218,7 @@ struct apple_sart *devm_apple_sart_get(struct device =
*dev)
>  {
>  	struct device_node *sart_node;
>  	struct platform_device *sart_pdev;
> +	struct device_link *link;
>  	struct apple_sart *sart;
> =20
>  	sart_node =3D of_parse_phandle(dev->of_node, "apple,sart", 0);
> @@ -236,8 +237,12 @@ struct apple_sart *devm_apple_sart_get(struct device=
 *dev)
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
> =20
> -	device_link_add(dev, &sart_pdev->dev,
> -			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
> +	link =3D device_link_add(dev, &sart_pdev->dev,
> +			       DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
> +	if (!link) {
> +		put_device(&sart_pdev->dev);
> +		return ERR_PTR(-ENODEV);
> +	}
> =20
>  	put_device(&sart_pdev->dev);
> =20

I *think* this is okay...

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB94FCC062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjqp+nzVkHY5IgyvI5b4YAv0FzCMSJoruY9g4RVtXLk=; b=GU3wKgICgLu0J7ur3TAcQiEcop
	jbB9fO5f0/O5sY0e3oV7mDMf/HNfrM4cOztPu/nbyEAJTbPAtTq+FyowHjBhVoczROJCO1REF5GLZ
	QIArtI34XLA/WNmEGsNheIRdFvF2Qb9dl5xQIoWrpVnSJRY9p6XSiuKjCM5ookstf5ZDV/Vvyp5yo
	0FyM9dXcYg2fxyGer3kog0ZjDlxpLB4DoAc/s4Mh8TiFXqETh8kf0kzrFeJB4EUVmEnByrFXewNgx
	tIZtzEXBBthmcYTH6y5izD5PjBEevRzcA8cQ7WEkmUq0z7p7vWPJBuuepqBkPouteYrx+f0PMHb0M
	zohr+aZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyar5-00000004P2P-3OFj;
	Fri, 06 Mar 2026 19:28:59 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyar2-00000004P24-33k2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:28:57 +0000
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id yXDFv2UIUCxrGyar1vxDoD; Fri, 06 Mar 2026 19:28:55 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id yaqVvZvPRqfpWyaqWvXQ6L; Fri, 06 Mar 2026 19:28:24 +0000
X-Authority-Analysis: v=2.4 cv=A55sP7WG c=1 sm=1 tr=0 ts=69ab2af7
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=pGLkceISAAAA:8
 a=mRCR8zNIrG22jyqt1SMA:9 a=QEXdDO2ut3YA:10 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qjqp+nzVkHY5IgyvI5b4YAv0FzCMSJoruY9g4RVtXLk=; b=dH8FEDR+0dFGLSuOOlBK3tq2AZ
	YmFQ8JxdWT6KjQcmWXkCY8wiP40rfVYI3Y2z+lYk/1ju7xQD8hMnrZcq7bW8k6Xc7JEJss+kJbSbN
	AAlCndnTO1ss5a7fTD15Ycd+GldybKPVNCwCbc+jOwznsF+a1JKTGfEHrOgeVLiYH2TNEWEJY95b3
	HS9fe77LTET6Be75UgbfEKLVINFSsxkXokN/m7rbZ4t3E6uOM4PtoizI0Jvv0SZ62a/htY4Ui0vPR
	4+cdKI1RzSOR41DdFckRUxrOWoe1JfKfYtUAXI1ZouKwAfjikmgo3pZ5on4Wwd6rFBP/s20Cfu1m/
	lwEQIERA==;
Received: from [177.238.16.13] (port=44592 helo=[192.168.0.21])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vyaqU-00000001RPb-39v6;
	Fri, 06 Mar 2026 13:28:23 -0600
Message-ID: <72e8b51c-4dcc-4c42-9e26-8ad8f9299c76@embeddedor.com>
Date: Fri, 6 Mar 2026 13:27:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: miphy28lp: kzalloc + kcalloc to single kzalloc
To: Rosen Penev <rosenp@gmail.com>, linux-phy@lists.infradead.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "moderated list:ARM/STI ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260304232848.469446-1-rosenp@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260304232848.469446-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1vyaqU-00000001RPb-39v6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.21]) [177.238.16.13]:44592
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 35
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFbQ/ZSMytmZSo8wYRfKXIO4wQrp5qRUQ3AJD4XsLo2PV+9WNXAOopt5pa1hNbgkqwHcocEqCBgxMEV3WeiFNDQvlgT1A4PWOXEB0+05Dj5o3YzsdFY4
 QwMrCLptod9KqmC1zp+fLhV2MKFI7zeaswWPahmRE63fNo3xz4za0IOkyrVHicOy5W/x4y5kDTfLyodMU8+JlFQFIKbeKkeAlu/lSKyoCLKzKD4XpM8iAPVL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_112856_865102_29828B7E 
X-CRM114-Status: GOOD (  11.76  )
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



On 3/5/26 08:28, Rosen Penev wrote:
> Use flex array to simplify allocation.
> 
> Allows using __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/phy/st/phy-miphy28lp.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/st/phy-miphy28lp.c b/drivers/phy/st/phy-miphy28lp.c
> index 43cef89af55e..fd931ede7162 100644
> --- a/drivers/phy/st/phy-miphy28lp.c
> +++ b/drivers/phy/st/phy-miphy28lp.c
> @@ -224,8 +224,8 @@ struct miphy28lp_dev {
>   	struct device *dev;
>   	struct regmap *regmap;
>   	struct mutex miphy_mutex;
> -	struct miphy28lp_phy **phys;
>   	int nphys;
> +	struct miphy28lp_phy *phys[] __counted_by(nphys);
>   };
>   
>   enum miphy_sata_gen { SATA_GEN1, SATA_GEN2, SATA_GEN3 };
> @@ -1168,16 +1168,14 @@ static int miphy28lp_probe(struct platform_device *pdev)
>   	struct phy_provider *provider;
>   	struct phy *phy;
>   	int ret, port = 0;
> +	size_t nphys;
>   
> -	miphy_dev = devm_kzalloc(&pdev->dev, sizeof(*miphy_dev), GFP_KERNEL);
> +	nphys = of_get_child_count(np);
> +	miphy_dev = devm_kzalloc(&pdev->dev, struct_size(wiphy_dev, phys, nphys) ,TGFP_KERNEL);

This is bad... it looks like you didn't build any of these patches.

-Gustavo

>   	if (!miphy_dev)
>   		return -ENOMEM;
>   
> -	miphy_dev->nphys = of_get_child_count(np);
> -	miphy_dev->phys = devm_kcalloc(&pdev->dev, miphy_dev->nphys,
> -				       sizeof(*miphy_dev->phys), GFP_KERNEL);
> -	if (!miphy_dev->phys)
> -		return -ENOMEM;
> +	miphy_dev->nphys = nphys;
>   
>   	miphy_dev->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
>   	if (IS_ERR(miphy_dev->regmap)) {



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB7A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZxJMQafN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=nuJTrfl2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Al40yz8zX8CT/g6ZiarLm9qznrROayr99YdGIejOzh4=; b=ZxJMQafN5XDr22iRA5qPkWgv5Q
	mrd4vBYv4gUkcQE+6+rYM66jcRbuXGCSAt5H9pVQAi7t/55IqWIBaZWETy8/sOTx2CiFht0filAwN
	aZh8lHPWLpxaH/2uqTPZPfLuUnDEq2Lr6NXiHM0wNvDpf1d4rIHXfvqdkhqCqt0eemaTbZ6rmQFK3
	TovvNl+GVKtJvYwJ3O/SKTizQ/gcbiI+f2o+Cr9eGCv+Kr/A+oW7NDzfHQdaZqa19u10d6ralCLJM
	FAZRL/yENFF4ZdpRtqvNpko/s9sJnUHVwuxHqUERHUBGQClennETdw5w7QJtOZ7ZeMHvWvUWzNx/g
	GDh4xLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLS9y-00000003Hmf-3w5r;
	Mon, 26 Oct 2026 21:23:14 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLS9w-00000003HmJ-21wC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:23:13 +0000
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id LL03xB7FUc3XsLS9uxaQm5; Mon, 26 Oct 2026 21:23:10 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LS9sxigNJBsONLS9sxDZrC; Mon, 26 Oct 2026 21:23:09 +0000
X-Authority-Analysis: v=2.4 cv=cqabk04i c=1 sm=1 tr=0 ts=6adfc4bd
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10
 a=rJ5y2_88ZgdFKM9dSD0A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Al40yz8zX8CT/g6ZiarLm9qznrROayr99YdGIejOzh4=; b=nuJTrfl2cv6HWnm3fhxzkWe/wA
	VRs0DQvGsuWH00LII2CP9tHoiCLQbpQ1gAfDgO3FBNi0UjcPIij5TKwMZQ/8O9Bn90eUZFX2PawpY
	o6mQhUQ2oruu/5lqTVgcG6tHLUaqTs98tswJg7VsyFAoxVYLDXCdKavCj1Us32IyROR6qkD7uzH67
	xdd4qsL9/3MoEIE8y8PrEAsWMIuUnacs27mT2FoT5q1gPdp1hnoBdRE8J1e12Udtcb2j2Vu1P15i+
	etQopKwhHD+6GmUDQutNAX+Ig3VRKBWGqxgpzfGHSol4/LsFBViabi1cWM0haUS09OFpvnO47rnoo
	pt8t2C0Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35782 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLS9s-00000003SIU-1SbN;
	Tue, 27 Oct 2026 02:53:08 +0530
Date: Mon, 26 Oct 2026 14:23:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (macsmc) Allow enable writing to fan speeds by
 modifying sysfs
Message-ID: <2cc7dea9-9a0e-4532-8ed6-74664c621fae@roeck-us.net>
References: <20261018113248.12243-1-aditya.garg@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018113248.12243-1-aditya.garg@linux.dev>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLS9s-00000003SIU-1SbN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:35782
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPYM59H0HDkMTNvLdlA2xCSK9WFUjTx86MKL/213GwmZ9gb2XxLPxuAdmSB8d4cWuUPrk/vcezi+7JhGXoprHuAyCzWTEEPMkV7Lnl48+soWpbY3Dz4F
 R2jWjGRv7Clsom/uAyXurcDHrXObwtKJyd7uZzTmojVqIQxF11uccsdRsq2ATUDW/v46fV9XxReqdaQdwCbt92+lHzpVYfF2FltvnlF/n3a96KmilPL9ZzKj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_142312_552647_EF11A61B 
X-CRM114-Status: GOOD (  14.28  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 18, 2026 at 05:02:48PM +0530, Aditya Garg wrote:
> The fan_control module parameter in the driver enables/disables the user's
> ability to manually modify the fan speeds. In case the user attempts to
> change the module parameter via sysfs rather than at the time of modprobe,
> changing fan speeds is still restricted.
> 
> The reason behind this is because during probe the fan_control variable is
> used to restrict the user in the following two ways:
> 
> 1.	if (!fan_control || hwmon->fan.fans[channel].mode.macsmc_key == 0)
> 		return -EOPNOTSUPP;
> 
> Here, if disabled, the OS will return an error and will not allow changing
> the speeds.
> 
> 2.	if (fan->attrs & BIT(attr)) {
> 		if (attr == hwmon_fan_target && fan_control && fan->mode.macsmc_key)
> 			return 0644;
> 
> 		return 0444;
> 	}
> 
> Here, if disabled, the sysfs files are with permissions 0444.
> 
> In case a user changes the module parameter via sysfs, due to the second
> check, the sysfs files remain with permissions 0444, and user isn't able to
> change the speeds.
> 
> Since 2 checks are practically unnecessary, and the second is causing problems
> this patch removes the second check. Now, if the module parameter is changed
> via sysfs, the first check will pass and user will be able to modify the fan
> speeds.
> 
> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>

Applied.

Thanks,
Guenter


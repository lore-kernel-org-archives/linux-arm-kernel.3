Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5744CC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rsepp53wmdFvcjhxH+SZlO9xP8vtYlvbJCuU3Gb4BxE=; b=L6E0c7p65fjcrCT7zXkjTchXmt
	U6G2H9Htnw1OHUvewxtDQb+uoH5eQTAvygG8zjXp8uoLjVmba5awPuF+nbZpYu5MVrsy42Ur3Rgyr
	xtlrcAvIMLSXwSn/dkeKdjnZYzad9CeuZV95GvPoHBwMUZJwqSKykbtKhT/7LoDLbXcz7aWJAivAx
	Ar1Yq3oa2z8i8Wno9jzJXPelycS9WdgpXJJNRjKR0AZDVi6FuKHJR7Ry4XxnwBEnhpnehJdjwlPPT
	W4/Xs20W8ej2ZsjlUROF76rRiOM3eoYKqb2MhsqYd81u6+93OU+emP/YGei8GYou27tUVlzXq18LC
	+gEfd9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YKm-00000007o8c-3Lf8;
	Tue, 15 Sep 2026 18:56:48 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YKk-00000007o80-1QaL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 18:56:47 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BADDF4090B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789498600; bh=Rsepp53wmdFvcjhxH+SZlO9xP8vtYlvbJCuU3Gb4BxE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UzRWKz/gL76bsYRzmkkw/cMgDVoueXkuRGyY22r868vyVRyL4uuDAFl/JkG7Ug52l
	 99PnMEG5jFR5yrrXVGSCn1cHcIkuGShrvhhpDXGpeMJZ949ZjXtqGzC5k0rI6JCcat
	 f45CC2dmBV6xGKorRvqwj9liU09AT6gO1D2xu3I2jRHpJ+jbVXXfDVsXOmVVfrkgfA
	 q1cLQJbqzUYUdbez6d8MUZUOACBWXYWGWVF2SZcZDmxsLbetTtHqXSFJ5LTN3q/VP1
	 CBLKOYDgX9X5GaQd/CsL9n1gKOv4hdaNC5DPUPaLw1TJEEl5wzgPbbDNw02q5PTy6X
	 A3KZZAVwdKAcg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BADDF4090B;
	Tue, 15 Sep 2026 18:56:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Michal Simek
 <michal.simek@amd.com>, Ronak Jain <ronak.jain@amd.com>,
 linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] firmware: zynqmp: use literal blocks for commands
In-Reply-To: <20260914060615.1398531-1-rdunlap@infradead.org>
References: <20260914060615.1398531-1-rdunlap@infradead.org>
Date: Tue, 15 Sep 2026 12:56:39 -0600
Message-ID: <87ik469wd4.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_115646_382981_8CE5C007 
X-CRM114-Status: GOOD (  12.81  )
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

Randy Dunlap <rdunlap@infradead.org> writes:

> Use literal blocks for 'cat' and 'echo' commands to separate them from
> the surrounding text. Otherwise the lines run together, without any
> clear break before or after the commands.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Ronak Jain <ronak.jain@amd.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |   70 +++++++---
>  1 file changed, 50 insertions(+), 20 deletions(-)
>
> --- linux-next-20260911.orig/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> +++ linux-next-20260911/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> @@ -141,32 +141,44 @@ Description:
>  
>  		Usage:
>  
> -		Select over temperature config ID to enable/disable feature
> +		Select over temperature config ID to enable/disable feature::
> +
>  		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id

I was sure that this wouldn't work, since the literal block is not
indented relative to the containing text.  Sphinx does the right thing,
though... so applied, thanks,

jon


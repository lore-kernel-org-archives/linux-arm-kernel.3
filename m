Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1C6E6F098
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7tfZu18muDy0P5XoKsuDPWXkWyRiYAk7XmtuO2uyHA=; b=BE1krviFeIlR/Op+SCJSckrqoF
	IG77778I77cJUo3fqh5euC4EFUjI+EChFKGOQCCu+/gJxfMqQOzAVoFu5ua6XpglRddEDdk+GEq7U
	kJTjix530i2OX6ups3CNIAVZRyYGKeXDqkn5XNzR0L8xLXn1fKDVoumIDyaI2vwnChWj1tSkuFWcL
	99M07pQq/I3qJl+MW6V229aN/oSlNRMUBCwSObZaCfNBnI0PzlA4H1KEMbwIstlCAp9oH7U9nKvLd
	F/bHvj4aIXzEtYJ7qgKxpT9JHnCrAWKDA5iayTUnN1ugtyz3ft6+dr3ef8yhAtsKTajo2XiLjQAtV
	PE+y+e5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3v1-0000000FeR0-1NLB;
	Tue, 23 Dec 2025 15:03:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3ux-0000000FeQN-1EcJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:03:21 +0000
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 02DA1833;
	Tue, 23 Dec 2025 16:03:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766502184;
	bh=+pdYS7oe+ITloB9NSURDJAUtEhD90+1rBYIWPa+W0+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLQh1bYJiqifUkTNmfTC4646turpArYJ6YSdrSmenY5w2VVgKkX9J2qh5crWXqOCl
	 MS7XBJ1XLKmdY+dAPNUiC/YpCONHhQVjUKXekH3f0cv6bnArHKjK4z4KQOtnGQ0ZVj
	 v9+tbw0t1WWw14tj+cHvP77oIeqzhORHYSaquSi0=
Date: Tue, 23 Dec 2025 17:02:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
Message-ID: <20251223150256.GI9817@pendragon.ideasonboard.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_070319_481281_0518FA0C 
X-CRM114-Status: GOOD (  19.45  )
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

Hi Krzysztof,

On Tue, Dec 23, 2025 at 03:27:27PM +0100, Krzysztof Kozlowski wrote:
> It is already documented but people still send noticeable amount of
> patches ignoring the rule - get_maintainers.pl does not work on
> arm64/configs/defconfig or any other shared ARM defconfig.
> 
> Be more explicit, that one must not rely on typical/simple approach
> here for getting To/Cc list.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
> ---
>  Documentation/process/maintainer-soc.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
> index 3ba886f52a51..014c639022b2 100644
> --- a/Documentation/process/maintainer-soc.rst
> +++ b/Documentation/process/maintainer-soc.rst
> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
>  
>  All typical platform related patches should be sent via SoC submaintainers
>  (platform-specific maintainers).  This includes also changes to per-platform or
> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
> -addresses in such case).
> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
> +correct addresses for the shared defconfig, so ignore its output and manually
> +create CC-list based on MAINTAINERS file or use something like
> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).

I fear this will be another piece of documentation that people won't
read. It would be more effective to implement custom logic in
get_maintainer.pl (or at least output an informative message).

>  
>  Submitting Patches to the Main SoC Maintainers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
Regards,

Laurent Pinchart


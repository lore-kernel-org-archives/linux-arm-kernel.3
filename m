Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F41109E522
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9++I9DH96vmR0RmaA4mm1thkdXF3n+A3YyOdv9DBJWY=; b=Izr8ZvaxkLBVoqBNlwDSdq8oak
	eZlK/tJ8LjxCHQyjI9xdFWUwiByqD6+BqFrEdBTtZdPJjAZu/Pnj2dF4DAbMBgtmZAuBVTXlqJKei
	82+8cVhKdvtcGefmiUcpLHmlwe2t/SdvOf9gxErnWPmTu1I3CeB1u302Nv/CY0q+AUjvYU/3vo1YK
	10/OkVgKQaHRK30kv9Ya+ly22Pv0y3tJYN5j9vncY24uK2W6lCbe2owq89HZsERWAG9CuWwIvBbmo
	jfAL9a91YzGiNSoK2VGUzHT5S1IFKnTfBBMkvLom/nYe5put1ohm7Kgh6WAsKMShlMcHLIElkNjDS
	sXan9Skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WPI-00000004Jcw-29Xc;
	Wed, 25 Mar 2026 22:08:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WPG-00000004JcU-2k4d;
	Wed, 25 Mar 2026 22:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4BE44438B;
	Wed, 25 Mar 2026 22:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77100C4CEF7;
	Wed, 25 Mar 2026 22:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774476533;
	bh=0SMSGojWeEuTf6IRTzrQ3Ja6RfzXsvEFtgDkgRMiJQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UuFJlqT+amWQ9X9bdFAzekPp6vT+mLRWg+bh7t8mm5kUwFOyK+XoJanIpT16W8hc/
	 eINb0ExdNWpmeWKVYgWEFLcdqJ9PTSM6IAM04cf26CAblCfJJb6SMW/x/7lMtwOpxr
	 hirz9grYILPtqgoi7QIU35kWfS2QOpYkoCCwSnJfhQRZbPuR6C+ZD8glMMFWUlHuFM
	 66cEa/nH3RxQG1PwgXNS3UL/6m+RnNpqaDpTQ8N8bS0pU3/CLZ/CokfqWf9Oomrba4
	 rbEh1uENRqFLyISAdL7O+6rQRGyrhg6kxFJ4bEGzmQ5JUYbGUtKdNdWA+z3ObT8tH2
	 yLECRj2cMozoQ==
Date: Wed, 25 Mar 2026 17:08:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	van Spriel <arend@broadcom.com>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: mmc: amlogic: Add compatible for T7
 mmc
Message-ID: <177447653149.51426.16186779467459325045.robh@kernel.org>
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-2-44c7b4a5e459@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-2-44c7b4a5e459@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_150854_715241_9B7CEBEA 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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


On Wed, 25 Mar 2026 10:15:20 +0100, Ronald Claveau wrote:
> Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-axg-mmc
> as the T7 MMC controller is compatible with the AXG implementation.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



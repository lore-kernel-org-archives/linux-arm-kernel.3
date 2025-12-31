Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935CFEE499C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ko1PBYnAT8egz+JnKmbCvCQlCqzSxgJzhveEIqLEVKY=; b=WyeXqZxoXLciNgmhzwrUHHW9P5
	VdZ0i9bBebV8RqL6b1tgHQN7NBRMZgjSCAvsf22mGXgBtKsEVh/t6wmnj4CChlUK78JFOAqnYifjf
	YJk5offKWdLEvhXzweHDVOEndcA16cogoXExMXNx9LAdflhWWff9rzSECa+qHe+hZ4aMQhNQZGnpQ
	leUZfLBDWXfzrYDVNdeEXGmU80nVQZGGoZ6/1mOaaRZizK4LsGPCmZ6EBzq0WI02GGvfF1jZR4elo
	F+CLZgLmTZGAuvOtZe9a3IQRyY8OJu8/kTdHMZroCGQ+w8sBJa0I+nXOMeB3Q+tgyEY7hJGTAntI/
	7h36sTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valiJ-00000005Z7r-0ztz;
	Wed, 31 Dec 2025 02:13:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valiG-00000005Z7K-2jU1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBE1A4394A;
	Wed, 31 Dec 2025 02:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D097C116C6;
	Wed, 31 Dec 2025 02:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767147203;
	bh=PCoedTJGv1Pig+WmC7clDH0HKtaOVbe/hHN1RGvcRTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jzd9x2z76lUHE9i9/eoEcrwHT8qHqY3qSXA48kgRVpCeyo7CO+0S2ywMuWq/M2/1+
	 CwkXyDvT1a1J/siUxm6NupKhrp+tD9b6MxCjHu8299ifXVHi2+XZyTtNR4ktvRkqxk
	 W/J3ML4F9IpfFFSWAwu04gpCmVos3xCVcQuMsWebbysbGeYr7jWKxG3cF6I30pyNfh
	 6y3Z2HyvpqElq/7uYQfd+/oUeo5wI9SI/gSwYEaBcjZcgTeYBw8zaR7mcMgZhoVs72
	 l6TvWsh2dix9Jgij9XHwhv/PpHaicsLw8uT4A3+GB2H/ukfGgpKQwTe5Q6yZWaVW5g
	 igsA+lSp/amwg==
Date: Wed, 31 Dec 2025 10:13:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com
Subject: Re: [PATCH v1 0/3] arm64: dts: imx8x-colibri: add additional
 functionality
Message-ID: <aVSGvY0Zls3Fxr84@dragon>
References: <20251031125003.275033-1-max.oss.09@gmail.com>
 <aVOolTfi5s9jqG2v@livingston.pivistrello.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVOolTfi5s9jqG2v@livingston.pivistrello.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_181324_713596_8E4D5ACD 
X-CRM114-Status: GOOD (  10.81  )
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

On Tue, Dec 30, 2025 at 11:25:25AM +0100, Francesco Dolcini wrote:
> Hello Shawn,
> 
> On Fri, Oct 31, 2025 at 01:49:40PM +0100, max.oss.09@gmail.com wrote:
> > Provide a pwm-backlight.
> > Provide the 32kHz Wi-Fi clock used during low-power operation.
> > Configure CMA from the device tree.
> 
> This series was not applied, any concern? Anything to change?

Sorry for missing it.  Applied, thanks!

Shawn


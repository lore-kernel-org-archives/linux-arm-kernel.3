Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1EEE95A8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWr3DvHvizwIlzaZjUppjaoAhbnMY241mNnbOhVRo+M=; b=xwwVIVoqepuYaXFmgWnVX7MxMB
	Qamqmr0S4fy0UbW1Fn7YIahp1ahi2tZCg2ZftwNx/z1JAgqIjXdhHEftMZt3XP9E44rTYhZHIST0q
	9IJU/czFx/U4JRAX4KZJ+WZcDjW3Gukx8w3v5Eo8V47gzIL/QuJdOu73jp015DupQbfjPHBDs/5dN
	U012KHtUB+1HtsV+HYFLBmqEsSE4qC3+npHd/X8lEPKMu59+AA2Uz6SIjVoSIyznL5WS8klFNUMlv
	1sw3P9z86AJWBvxM7HwvyXqsKdcYnu7yk4W580nPHTiLgHX0+VKTXXrp4T5QcKNwcmk+SZzeD12Jp
	jQgqH+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaH2-00000004tD6-36TW;
	Tue, 30 Dec 2025 14:00:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaGy-00000004tCv-119c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46BB960010;
	Tue, 30 Dec 2025 14:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31719C4CEFB;
	Tue, 30 Dec 2025 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767103227;
	bh=EE5y5JDVSHSqsOK4L/74tha1GWgDSbx8+Ze9isvtm7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBBOhpuFJsrfcJe0Qw10GBlUq2s41q5Qyf5bQMhcVjquIqF2a9UdkFpuJfXV4P2aR
	 d2anRRn6JeYDmoe3NMf0ntwz/RatbZkBSDM4eFgTyNYvbDI+hHlI2SjmB8by5SPuvd
	 BpPk+mtzwSc3YV+OvPbKW25cp0Z3n32D0AHTVbHAkLyUp8vwVmd4qbhtl7zVyK0D2o
	 urmpObcF1cusJZEMfvO7HzjnLWg17AlipJdy5Eb+DjTPX3zgcGW7r3XZMfFuEHklZX
	 ozAiIbpyMY4VBmEFFxnGF7g6PenOCSAgLpV6JhTeua0zAd/mVZMpwLJGgZK5RLA02k
	 akOqdHPe65+mA==
Date: Tue, 30 Dec 2025 22:00:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx: imx6sll: fix lcdif compatible
Message-ID: <aVPTJTMdMIif83r3@dragon>
References: <20251223204302.519468-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223204302.519468-1-andreas@kemnade.info>
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

On Tue, Dec 23, 2025 at 09:43:02PM +0100, Andreas Kemnade wrote:
> Fix lcdif compatible according to bindings doc.
> 
> dtbs_check tested only, a glance at the datasheet shows that it should be
> the correct fallback compatible.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thanks!


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2901DCA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9X39krSCIV5mzuKxtwb13RjYJ1Mo7Wm4Xz5RoYh6xw=; b=btjtbczPyYMM91lTdUHQ7pcB6X
	4L9ubqYiKSKQvSost0tQpyMRCWJpt4fAHWPEYlq+pQCLHcDNzrA6v5MIfV+zFWES+8TjJgxqK8gGJ
	eC845ivRXJJHQqvHhsDdG9xW8RTcHTKxum3XAY+5Kmzqg3DUP1DNk4cRePHeh6VuikRduik6sJbAv
	tYb1VE8LwRq32TpM5TQRgxIkz1Jxg27KQYcObGwQ+74uv9dBfYUQUpMRiWJczl/c7ncZwcZmAlU34
	WH5Wryl0fjxG4X7jYtRUFfGbsw+NwJNpIkpd8rv44QIXFkv6KWul7DHYXCLeJYn/81hxLFdiT0pDv
	YA6q0ZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv7Y-00000006H3P-3Ogt;
	Wed, 30 Sep 2026 14:17:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv7W-00000006H2g-1E7m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:17:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 715EB60008;
	Wed, 30 Sep 2026 14:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFCC1F00893;
	Wed, 30 Sep 2026 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790777837;
	bh=k9X39krSCIV5mzuKxtwb13RjYJ1Mo7Wm4Xz5RoYh6xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qi1jme5FUMK17oOBbaBrDU3kYs55uiylLWiHux3LbfjO2PULoUIfzJt9/EG3b04r1
	 6Svj13TomjSscAhVcuasLxxYSoGt6omZAXHEd4RWsyO9aMA8FtadkL/blP5jBXlHPL
	 tv2UR9UKzDF9Fk0p8deUb1YAnC4m0nDxBjSIBDB1zcdzY/3EVhy0EscmcBrkKqCva9
	 pY86fY6n6Av9rMmQ19uP+Rjb8mMYrXjCGhORinNvP/Tz4yIlax1+eeicBOW1ry0qnj
	 DhTFB5VgXu378POq4fC/Hh07yvXmNquVODgh/r++He7iHrQM8cfBi7rJTivJE/5oO7
	 2WwGiL7o+WKfA==
Date: Wed, 30 Sep 2026 15:17:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/11] kselftest/arm64: Remove the sched_yield()s from
 the fp-stress loads
Message-ID: <ar0DF2P1BdEaGXrM@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-7-31bce995b49b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-7-31bce995b49b@kernel.org>
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

On Tue, Sep 01, 2026 at 06:06:47PM +0100, Mark Brown wrote:

> Signed-off-by: Mark Brown <broonie@kernel.org>

Had a good look through + all looks sensible to me, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo


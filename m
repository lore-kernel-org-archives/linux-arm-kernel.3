Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F6FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3mItwwv65F1XLd+7C5xh06PcIvQu+IvZ3f5R7pbjSQ=; b=rRZIN3MC0JoLgK/c1YvP9AMKjI
	HM0/Vlr2dYKZKlHC04o3vG80/YwXcMUhPy5F6RZ8cR0oXHXkXng+cFbg2jTVYN2IUjhPqaXimP0vh
	jAU9a2u1QqScsWdc3WQgn711XATV7ylyLjtbYZ0dACswQEyY1eMqlcyNDfb3qWog1eAInWyZ1Ab58
	bqd3yxWfI5jR9j7tlVlymcNYTy6tsXznDwNs2RjimvfM9g+9zIa2g8IoKmLW00jl9VtmOa6d99xbY
	RXEJoXaUWWtCjKe8YIVea3LQUxUmk1AnEz2SFaGhLL5KmVAGxJ6DDqLDwl7paCrEaYkldjanPcFTO
	+1Ayl7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4vT-0000000CDPX-0KLv;
	Wed, 15 Jan 2025 15:03:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4uB-0000000CDBW-0krY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 15:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E004EA416BF;
	Wed, 15 Jan 2025 15:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406B2C4CED1;
	Wed, 15 Jan 2025 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736953321;
	bh=oSgVQD0xpvqqlDYs9nEBaWNPRJOFZ0gODY4jWMuozSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HU4IdaWE9T7LSDzSr52omxBfSAnoOD6hTdqDHxZUJnnswkLVpppcmpKrEf1j2jlP/
	 ETr7bZH1kIA7yPIXV6Hk64SJU8Uy+L/+0+zddB0c+EyBcrmqsAgGYjReM8IBvhp5fM
	 DF5d3mWzG3cqC6l1XCrriHa2JVYljDFN2PbkVuh52Uv93+8LM6cMG93eUFN+q8jYDC
	 1Gji8mX7IAE37wjP9QsREvh4ozg0Pb24UFQJSdzlCALY/XVQuoOTUysV9UkMmttYlU
	 On3yJbr5XBvkOXqPETPwMruSeNpVsPGJU4OuBwKCVpG3rLGOpDfDqsVmsAfFgDK4DP
	 abXYofRqXYr3A==
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20250110120736.58831-1-lukas.bulwahn@redhat.com>
References: <20250110120736.58831-1-lukas.bulwahn@redhat.com>
Subject: Re: (subset) [PATCH] MAINTAINERS: Adjust the file entry for the
 qnap-mcu header
Message-Id: <173695331999.4116163.16095608205046775735.b4-ty@kernel.org>
Date: Wed, 15 Jan 2025 15:01:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_070203_279957_1DB05C31 
X-CRM114-Status: UNSURE (   7.93  )
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

On Fri, 10 Jan 2025 13:07:36 +0100, Lukas Bulwahn wrote:
> Commit 998f70d1806b ("mfd: Add base driver for qnap-mcu devices") adds a
> file entry in MAINTAINERS referring to the file include/linux/qnap-mcu.h,
> whereas the file added in the commit is placed in include/linux/mfd/.
> 
> Adjust the file entry to the actual location of this header file.
> 
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Adjust the file entry for the qnap-mcu header
      commit: 2816b0c949af89640b8dc05de53e650cbf1d55fb

--
Lee Jones [李琼斯]



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08340C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgX4TZwd/q8I9GfoBn2GHUK8k1wrjatw4FjW65ynwbI=; b=Mxi1ToQ//Bo9tEqtBlCxj5YUKU
	U45ktH/5og33aplYKtZ30TzilsfHyGSmv7vd8ZxEKeHSq4ShwrJjzxnYImj+fHAE1LOSEO3Gn6/t2
	Ls65HN0aRUho/zeMfZc+GkFHV/aKyTwis4UTbWWUWOtMQK++XdWpjXb/YQyCcS+fEgdAXTVKAC17v
	YfucKWcEvjbG1qagt5jjXGQKF2dFn2KCS8AQtMsR569B0TrI4ot+QZepemkzC9vAESm6JLHhNF01+
	8NsuJHTNABSXhsQCxtNNRfNIha4swRhcpqkpMDZzJX/ECBJ+xhaEWeff22G0ZBuPkKIhCRNSVBF0G
	1gWTFdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfJD-00000000XbN-3WcC;
	Sat, 25 Jul 2026 16:33:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfIy-00000000XZ5-0buS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 16:32:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95F7B60A6E;
	Sat, 25 Jul 2026 16:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E361F000E9;
	Sat, 25 Jul 2026 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997171;
	bh=lgX4TZwd/q8I9GfoBn2GHUK8k1wrjatw4FjW65ynwbI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=YB0IFhhC0yLDypt31DK+w4LtxBJRIUCbWT1JJVNn3pXVBF2ZKzP2ZUFX9oxRvOt5d
	 dVxM+wbV30zuqBV+8vHOhfNJ74ZyrlZS+KeJZyBJHN2q2ZtSSFHsM3Alh27kiNpezJ
	 J9bgeEn539BWWQ/l7T6UwNExvRjzq1R+26Q/P/I3eNvDXCwtPZev0NGKew6fhf+ZkV
	 TBF/iu66auQDYyK2tbrDeyC9EP/8WvE+vDmf+UpCCAfqISrRQMIt2zQmgJnKJwuuf3
	 JVSpdPJb0kRSRUDdtffOz0CHZGZc7uFF86sti5zjBw6Xsr7qyTrmpmfzKh3QDlqqCQ
	 9BDxjBtQsFYRw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101805.341103-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101805.341103-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: vt8500: Correct indentation
Message-Id: <178499716871.107055.15917286098671074404.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:32:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Mon, 06 Jul 2026 12:18:06 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: vt8500: Correct indentation
      https://git.kernel.org/krzk/linux-dt/c/eed86f8c39a2f76c1b0b017aecb63b3a8a53eda8

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>



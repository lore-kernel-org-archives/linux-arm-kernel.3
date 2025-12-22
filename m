Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDE8D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwceKIu0iNDeVFzSHSeg9hgm1+EAbjVkGy+oxvE0o1Q=; b=f045wRDXPGk69vBdtskEcQ7uMi
	2iL8/PeQxP/HTCUcOvTReCxdhRaSzUD34/aPDhA87DojLgwW7KKC2goHTIy+RqilGIfv6/2rD5PIc
	nO/wEGEz7SqlXx6qyELIswWLKSsVLks/bpWU0gcowBDI5lHYBrPYqqU/tUeCkFPa9L2CnIj0qn/Q2
	7CGqAudfPOnUeGSIir2CZCYdUmQkrJ2E+BrdH0qHn4UXgxwI0H9vX01pcamcADQzcm9rXUW2lzYK8
	AlBsLhLRKYtaLvjk319wUqUcis1ktlJwX/L8kUtVum/lWV5hwZhXU4u92Ggtobw+xP/VSiNTsGj4q
	CysuPSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcnf-0000000DalW-1BQ4;
	Mon, 22 Dec 2025 10:05:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcnY-0000000Dak4-08rM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 648D960127
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 10:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957C3C19421;
	Mon, 22 Dec 2025 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397951;
	bh=eBp8Cc57MU5RftAs6kSYu4shOivUqtmkwBkQrbiSaI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YMMQr/0fvFjJ8kOa38x8u+1SVw0sG+AAit9/9zD8OZxl0E9dNBO6X2zAl+kT8z7wT
	 f4cXJ9s1vKHt3N5+6taATT0rUa4T0R8XGza5PMuZHaMXEhMxZsaPN9hnFVECGHn5nw
	 3rGbmjtJwmJ4/GhRXi/mMY0VLbfAPrN1dK+MI+P8Di0FKRSxjXqt5t+sUkPr/bByUd
	 iO4mTJdjEObki3bKUdy1+ZKF1uopcNaCpcDnDF3yM1mhplkjBVLZ4JPPmTtSgx7rjy
	 843qWCTVvXM16gWUwMrd1VAxSEIwq4bbNZ8t4EGYb6uSqdY8//tuNBtYMQW7Y4HUSM
	 xjZWQPyvpDJLA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Richter <rric@kernel.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20251216180202.2794695-2-robh@kernel.org>
References: <20251216180202.2794695-2-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: cavium: Drop thunder2
Message-Id: <176639794821.32569.10955263518261221529.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 11:05:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 16 Dec 2025 12:02:02 -0600, Rob Herring (Arm) wrote:
> The Cavium thunder2 DT support
>  is incomplete. It consists of 4 cores
> (out of 128) and only a serial port. The thunder2 specific drivers in
> the kernel don't have DT support either. The few remaining users of
> this platform likely use ACPI.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: cavium: Drop thunder2
      https://git.kernel.org/krzk/linux-dt/c/f25aa20e92305c7ab7a6387b8ef7b6e83f8a49fb

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0B7C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNViOu0bmdlKvCzP7R188Vgz0v++cxxXh9hKKsjaDJE=; b=Phk8HyHtLpO9noikpbHO4UKYl4
	o5j/VYBLjcMHLuAVi7UrXky0b+2ehYK9XyDa9xwTcyAYE5WUubjhMHTtc9q2i3zD4ohqpfKD4Bv81
	RmMG9Lt1Om1c2zoHFDoy9WeUjXptGi27at3Lho7PShRk1zUKDECkYSEaeiWa7WdpZTudgLTgeExZo
	lPYwSTBrGCTQusb2+qjZT14HyGfXBy7JkjeO+bM6a7e/T+4eGZ7bSpZF0Ongvkz9OKrYO9PXidJL7
	7VXoi0eIHlKS9qsyETGyaZzGBS2jEmiAFlB0FpWlf+V0ipGiYizLYDkUid5RnCRN7CLJds0kVkc/L
	tXTc/IfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfFI-00000000XJT-0oeM;
	Sat, 25 Jul 2026 16:29:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfFH-00000000XJG-0cds
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 16:29:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25D3A60A6E;
	Sat, 25 Jul 2026 16:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A364C1F000E9;
	Sat, 25 Jul 2026 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784996941;
	bh=rNViOu0bmdlKvCzP7R188Vgz0v++cxxXh9hKKsjaDJE=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=LlBWyc4h5AEbwreKkBN/bSuSwFWWU99XSq29oDy5lDPuL7I4a9X15bo7+3/A/WEXb
	 g01GWUxyxrE2jvXUEu+7Ls8cOvhlirHbXjvE1bD4mjCPxMD6G3tNvBUVvbtXHO1vpw
	 iMPt4noT1UIsQCYK3p+nq0d6K+A7/HMNhBF0GoIzvw0ORPwUuWQft9PamsPifOql5K
	 aNAetzbkHjuGM0bDjGo2433BPRhzv01VgmjnmqIp7y4ice9vTq7FgV4Nw+Ai8KkI+U
	 y5bjfqqSaZ6xY0zf+N8b7kQzQztDxkmfoX17GzgZV2Imq6ObPBAviu58Du+pRRa3LS
	 /1pPD5x0RQMRw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Palmer <daniel@thingy.jp>, 
 Romain Perier <romain.perier@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: sigmastar: Correct indentation
Message-Id: <178499693837.105383.1427085500014255717.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:28:58 +0200
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


On Mon, 06 Jul 2026 20:04:05 +0200, Krzysztof Kozlowski wrote:
> Correct indentation to one tab.  No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: sigmastar: Correct indentation
      https://git.kernel.org/krzk/linux-dt/c/fc87f5285304b51b586218d22f7d1f01e72d9328

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE82C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKQ0TekucpNtI+i6I1k4qJag+fcr5izaMD5vy3kgNko=; b=Dtg4kni8vgc5flABdowoI/Gfgs
	NIZhAQCQOz8+dZ08r+hNk5QNMBpB3NYRx7LUY9kriWwlTdTukDFTPMrojrqIuLqVUZijrGgtaiFHl
	Nmb7VhOAwxoxiIc0uHdQS1VB6P527ulhTghCoBNv1Cm4P8m0+cmBpNhcaGJXqB4/ExA6fAHbPHK6v
	7mfehZ8l/vlmUs3VCXIVikkAMxcuDQSmFLp3kvMXQH17gN0U4+HhmpxopnoNJwpkoYInXkBi6BzMG
	9GKELqMLlWuf8xFPuN/jhB2Dlc1R7qIs05L8cRnNrDtXl5VAt6mOOVQniijbi/Hl/tKu4ryWEbI3a
	h/8idDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i8P-000000032v1-1BCA;
	Mon, 21 Sep 2026 17:48:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i8N-000000032uH-3abl;
	Mon, 21 Sep 2026 17:48:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4629440BF9;
	Mon, 21 Sep 2026 17:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D1A1F000FF;
	Mon, 21 Sep 2026 17:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790012935;
	bh=dKQ0TekucpNtI+i6I1k4qJag+fcr5izaMD5vy3kgNko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LnyqIG4Yf5/dTN/fEwinJ4Oq4274a9bKDxtUuGMKOSxM2XqhOv7D1YKdgKQ0BgX2E
	 v0BdGsp4HMuXgMPc56pL4ICDJIDZLLSSC0tbOnlH1js4g8NbNnAryjPBl1V7XCnKm9
	 kaWzpLLmjhM8ZamcNuBWeXfwuSawoRjdDZ/nF0vz9x99PWtpNcaPgtxqwrHS80Wb38
	 AjDzXbjtoiQHxPbzlItfZhm+IrtaAy10QrWGL37OiyQo+BIGj6eXfE598sQhw/c/LZ
	 vQtEgi2aBbts+CleVzt6uQ3Rdg1/mknDZhdOIDdBCs/q2edW00f+ozDf3Qw3rlhNun
	 JTx3htEr24OBQ==
Date: Mon, 21 Sep 2026 12:48:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Artur Rojek <contact@artur-rojek.eu>, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Use consistent indentation in the
 example
Message-ID: <179001293281.1071018.1885750627335325381.robh@kernel.org>
References: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Sun, 13 Sep 2026 14:33:11 +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/input/adc-joystick.yaml          | 20 +++++++++----------
>  .../devicetree/bindings/input/cypress-sf.yaml | 14 ++++++-------
>  .../input/mediatek,mt6779-keypad.yaml         | 10 +++++-----
>  .../bindings/input/microchip,cap11xx.yaml     | 14 ++++++-------
>  .../input/touchscreen/eeti,exc3000.yaml       | 16 +++++++--------
>  .../input/touchscreen/ti,tsc2007.yaml         | 12 +++++------
>  6 files changed, 43 insertions(+), 43 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



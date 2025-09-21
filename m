Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC089CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soBa2oezW8nf4zezqJfB5iwthPmZMENdZKVAQmbO2XA=; b=lFmb5/tXzzm94FYUfEJDtThD6e
	+ahFbd3rWbqlTxlVTvcWjv42D9NuT8mOZbbSaNN9opE9yo8uu6rucE7B2ZOV3kREgWYvGBGaGxYGW
	np7vop8pk8C2EZ2VFhwlvVGK0LJIDQt3IDWuwcPkUb4LN2xvSK50B9clfeVkOWHZ6KprHzUDLDFYq
	8pxB7k1oMZ8U65N7LD5pYIclqq++Qijm2YGYmyo5kUQoxjMMU6TNOh+FzoMiQj8O9+87FZWNtzZF4
	5pkb46k74g7YwqWCXfaRDEVVkJTN9+QY5P1UH6Ueg9p5USUqF8UfH2L7bErxvmoYaZCnXfjcbRnoB
	k7rWB16g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MzE-00000007n9Y-1oSn;
	Sun, 21 Sep 2025 16:32:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MzC-00000007n8S-2YMu;
	Sun, 21 Sep 2025 16:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 482514413B;
	Sun, 21 Sep 2025 16:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4154C4CEF7;
	Sun, 21 Sep 2025 16:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758472346;
	bh=soBa2oezW8nf4zezqJfB5iwthPmZMENdZKVAQmbO2XA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CKnIYujzbTwu5Lo7/XYXeS7fSJU4RVXtGBdaWZj3a3/Wx3rosl+J4a6Ot/hcqFmqx
	 b8lv3xchNz3iTnEYrFvk/euKkEkQS9UARo2Yx+deo6AwqxzsxKGydhCZ3vJ/NwSPMo
	 xRzqnw4+BMY0fDCIv24EDbJdpQeo5iOu5TE79KQuZ769xCrK3FzMOLFlMVQHUhXgUa
	 J2vIIB/zPENl5ADQF8KIWuCjTC2v7RCvWAUh4F0Djit7cdHZm+1VzAsu/0fEYbX7og
	 rm/xo87sXjlU0ZD8vULeHzABHoc4m706Ze0xZRpDv4sUuQpRZeO09gOnLp3zuLA2lF
	 AX/kUxzEaVqIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250724083907.61313-2-angelogioacchino.delregno@collabora.com>
References: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com> <20250724083907.61313-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/3] clk: mediatek: mt7622-aud: Add missing AFE_MRGIF clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, mturquette@baylibre.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, robh@kernel.org
Date: Sun, 21 Sep 2025 09:32:24 -0700
Message-ID: <175847234471.4354.16926506985701266468@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_093226_666650_1412244D 
X-CRM114-Status: UNSURE (   5.54  )
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

Quoting AngeloGioacchino Del Regno (2025-07-24 01:39:06)
> Add the AFE Merge Interface clock used for the audio subsystem.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013B4CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVEreEp0Hw8z9be2U0iUr/ECSYHh9yfdw1fSZ6anxtM=; b=htEZcIRs+KgSvnB3NpcrVpCV1y
	gWq0+OnKqN+rRKkNjnabWeWO7g9lLwtCa056npKqTNpKPwb0DeB4SQ0FvWTsmeXOcPgoY/PzwINpb
	RaStlVr+2AUk/uwTsZ+yfMWGQAB+QiiMW88SpDglkgZQJkWkl6hIKDIaAxRK6h0J5EcjZ7feUi0JC
	FfOc9VmcMSmmZHvVtg7R5tC/MR7fxKzvBXpsPeyTyRDImI3R7CJmdKC41RVnPvWdTt3E43xcghmvD
	FcXLfl7rGx3nHtmGt5zA42jG2k8ZLErskf/aD2U/M0NT0ZrD1k3temrn/lcwxpcdR9SyZA1II7UCE
	LvF9dIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKPN-000000004ik-2RUv;
	Thu, 15 Oct 2026 12:18:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKPK-000000004hR-1tKq;
	Thu, 15 Oct 2026 12:18:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FB5743F11;
	Thu, 15 Oct 2026 12:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE7E1F000C5;
	Thu, 15 Oct 2026 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066681;
	bh=qVEreEp0Hw8z9be2U0iUr/ECSYHh9yfdw1fSZ6anxtM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RIecqfOYt+nhoWwYu4s36KbOZQFld7TG/yeZsEz7i8hA2zroCZdfTU0tlxfDKa8gE
	 VomsFUpwcjXV9TyKq4ZOnLV8fCdd/1W5pkgS6fqnsPh8N3u426OQiptvlO2uXmDRrl
	 I1opyKbXyIglmsQxVUrTfIrRB5TLj9grUP9nOM/+lW7qXTJpzurUwbJkHJkllXZSU9
	 m0w19amKjxkvMNkG/BPjaQxZsxZq0W1Y5fQ69roYVfvG5iZnElgnKEARcoapKNldp6
	 exDjnjhR4fZ6n9HQe6ycHPbSE0jZp4aWWguUw6e9E7IRQ9lMILfb93NkQK5trbRe9+
	 TX/L7hjYN2frw==
From: Lee Jones <lee@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-3-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-3-23533a0d30e3@gmail.com>
Subject: Re: (subset) [PATCH v4 3/3] mfd: mt6397-core: Add mt6397 AUXADC
 support
Message-Id: <179206667779.1910726.5341177428334836457.b4-ty@b4>
Date: Thu, 15 Oct 2026 13:17:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Mon, 28 Sep 2026 15:57:21 -0500, Ryan Brue wrote:
> The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
> devices array to allow the corresponding driver to probe using compatible
> string.

Applied, thanks!

[3/3] mfd: mt6397-core: Add mt6397 AUXADC support
      commit: cc6597f4e3b752de42249879e0c7054fd23628a1

--
Lee Jones [李琼斯]



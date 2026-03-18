Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8FDFCD0D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eusZFuXcxSM+/mwttcHiZ345treM1b0FDMtGExayz34=; b=vnbSoO2k1BYcuK/E78cnP48i6m
	FLVq9qc3+KT2lFtQz3VpS4zUYj9o00QG0+Iip//y0oocmzDc4aBxPeYskdlwQcoc9ms2fjahTxP3d
	Wx/hjIMsxLNnG3VMs3gbNIioMkAi+pTiC1Jn6x+4mb6qguL7c0bvcg/Vn7tB8WUKmrUTRtEvvcXO/
	2nYg8r29CElvpQj2JUaC0hKEP1JmQnGyIvKMQB7g6ifQMIJQXUeAD+Qs4p6balEmK2XrAosw1sxYK
	kt00S/Ppymz8AAyBdHrJX4RFnmirBncijWUAcULi3PIWUr+WBWzDelstA3eo6AD//TKh9mQvq1rSU
	WrVIuT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2m5h-0000000822v-2Hzg;
	Wed, 18 Mar 2026 08:17:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2m5e-0000000822R-3A4O;
	Wed, 18 Mar 2026 08:17:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 519B643D7E;
	Wed, 18 Mar 2026 08:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA473C19421;
	Wed, 18 Mar 2026 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773821838;
	bh=+abhc8EHvLWzaaYvpz3TrPh7cY1194PGz+g1MgZc+zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXHw3aKUkgy7I9GXTS/O1allwuhL9lmxu6GeDUEH8VuRGkqS46RBOQAZHbrlbQtI2
	 pDB7vpJyO3GnC3efuFuwyBqd85rA/qJqci1auam+enTqKrp1oS7CgdYJm7MLLE8Gnw
	 Uncdfw9pSZXO1+gKdFOdWvN6qaUPqU3IHFvCXqpgC0qkovu01wYlioPMiWxqLoy1vP
	 UXpToFqXYHc6ajNjLjJEspfcG3CDMcJlvUUFaTfG7D30Wxbp4D7MTCyyF+0YnNGJlC
	 LxSVSf31TiLzXlK+zfRB4quWMyHY51M8glSxQqsYjdj9mFqo9vQn7M0T7/n/sQS6Zi
	 sRXK6mJL3/BsA==
Date: Wed, 18 Mar 2026 09:17:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
	Yuanshen Cao <alex.caoys@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: Add HUSB311 Type-C
 controller on RK3576 EVB1
Message-ID: <20260318-able-goose-of-downpour-db3bbd@quoll>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
 <20260317-husb311-v2-5-03c17c986abe@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-husb311-v2-5-03c17c986abe@flipper.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_011718_810101_5A4EEDAB 
X-CRM114-Status: GOOD (  11.54  )
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

On Tue, Mar 17, 2026 at 10:08:02PM +0400, Alexey Charkov wrote:
> Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controller on
> its Type-C OTG port, which also supports DisplayPort Alternate Mode.
> 
> Add the required DT nodes to enable basic HUSB311 operation.
> 
> Note that for full support of mode and orientation switching, the USBDP
> PHY schema may need to be expanded, such as in [1]. This is left out for
> now until the respective schema is finalized and merged.
> 
> [1] https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-cleanup-v3-1-3e8fe89a35b5@collabora.com/
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

DTS patch must not be in this patchset. Don't mix it.

Best regards,
Krzysztof



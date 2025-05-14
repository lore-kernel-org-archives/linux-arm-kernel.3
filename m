Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC65C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOmMb5xN19J6ykvsE/5ffgKvq1ToxVydRERICeA+2ro=; b=zU3KK0GMaoPyGKe68vkfmWOmI3
	DzQgEl0UpNJOpd1sR19wKWAGIWZ8EmpCfd+wTrsXgV9Z+uphBJ6+ykmBiyGGkGiBHqNvvIsmAAgV/
	VEheCQxWlM6WPGNidvgTZWpN+hl6zHvFZsuRXe0fGws21COiEvEsuMVDXITkKv0HICrdx98VPYUzX
	DfYZgDxr7nenAMJbDXJngr93ontJghgH46+uKAFRAW4xXvSAeDS8yrxIshTOpRUiib79d/DytGk+P
	bX7K15UJfLLfnDgJzYwDAu4N9hOsyGYdYKg7cCsfegikSF/dzpfWI0cIsL1kzayOFcIRk5YJVtjKi
	HNNXJCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCYa-0000000FINY-2911;
	Wed, 14 May 2025 13:54:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAQP-0000000EuRA-0JUd;
	Wed, 14 May 2025 11:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB3E64A29B;
	Wed, 14 May 2025 11:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50175C4CEE9;
	Wed, 14 May 2025 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222644;
	bh=whRcHaYLmRc/wgTuZhRzziRr5/mx4mKqhn1YvlOKatU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C1Tc2Fsmdztc7wrkLG8g4Qw1VjJzyv6ONkGp80F7mHpl9kJgjuB8d/P+ffsdAblyY
	 GzB/W49Ykc52JGnYcw0p6YUUBZ+mWI6Rw/W8cYfCBvfbejIifts5rvSGBzFVweflkf
	 wgJBO8psGajac9THxdwmFu831I/7OUtnYm5KyT9lL+FdMMk03kBgiSKAbxhG+Upml1
	 mtK9gD1SI0kZ8sPhNQMB5RvkORgO64tWIIWuXBEEsAlVmrzTakzlKv98ajvMxRvjCA
	 +gGCLJuoNg6gr8F5tKjy0r8yiKApWw1uvevZgBmydn9gL2j30gx0Tp0YfMTZB8qZUQ
	 p6AaWgtiverFQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20250416202419.3836688-1-robh@kernel.org>
References: <20250416202419.3836688-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 Type-C
 PHY to schema
Message-Id: <174722264197.85510.7578170417818621392.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_043725_135536_C807AD6B 
X-CRM114-Status: UNSURE (   6.46  )
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


On Wed, 16 Apr 2025 15:24:17 -0500, Rob Herring (Arm) wrote:
> Convert the Rockchip RK3399 Type-C PHY to DT schema format. Add the
> missing "power-domains" property and "port" and "orientation-switch"
> properties in the child nodes.
> 
> Omit the previously deprecated properties as they aren't used anywhere.
> 
> Drop the 2nd example which was pretty much identical to the 1st example.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY to schema
      commit: 2063eedf3c9c4449fbf417c9b84ecd08251c3b34

Best regards,
-- 
~Vinod




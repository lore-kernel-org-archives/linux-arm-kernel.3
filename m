Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB2ECFA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/VEFzM84Y9OBPN5IPiiv8IzB5PP/GcGyuSe7Fz8zeI=; b=NkstOLfAevtdpvm8aJB+LFxTL3
	1AltS5DA4Xn7zYZYUSTnavl+eje/lIFHppBeBK8B+g5cjUQIFwK6hH0vnFcoWFPgLiHJyH7wlMB/u
	UEXbNNR+OzEawqC8kiZMRIfh5fbnopE6fVBT3vWPo/5ne8yV5qOgTLwUAQcU8SMLkm3yO0yCSpDR7
	cQr/WQltSFqKOayo9E9BtqO8jmS+FX1XxWWbqYLF8gqpa8LcXYIoyrOi4Wky4CU0O+azEzWqOdVqx
	AQ1C+AYvrfdGwJNXQ6s8wswZj3LsRqo8KW/U7bKPf3i3zSLWasS8m2DrH1vgYWyc/5cfnqowgZMK2
	C72SxpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZv-00000007pub-1V0Z;
	Fri, 21 Nov 2025 05:21:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZh-00000007ps7-45bU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 05:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6F78443F6;
	Fri, 21 Nov 2025 05:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FD3C19423;
	Fri, 21 Nov 2025 05:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702448;
	bh=Q/VEFzM84Y9OBPN5IPiiv8IzB5PP/GcGyuSe7Fz8zeI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LU6VXLs7wKg3PTUWt+XHZ+E02tSSqAd7v4gTQuDUeEXQOXy0jFFjixfCAwr2xsOAf
	 mfuOdHyDaLUkzozd/KrIqi4G8k8ugjYP0BBBYpvULm+d9+9dujW3ChjLUk21JdGpOR
	 bU+ZUQ2kcGf64VfEbPcxvgiP8WPLL8HhhmU4iUCVA2kP1HYVrmjEZ2/omVjsDVstIm
	 JbsexUhxSoCV53IsN33IiLf1fy9tIVwfepUJGJNX5rMwBabGAqPgKam+Y68a3MQiQ2
	 NL/p9Cd5PxGuP3c9FwOuwgGFsvL+XVEcKT7tPOV3jQnpL0lNM/Bjs1p3/DDSvvxeR6
	 PN2Zli5JLEh0A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp> <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH 2/2] dt-bindings: clock: tmpv770x: Remove definition of number of clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 20 Nov 2025 18:53:25 -0800
Message-ID: <176369360530.11952.16156337990379437425@localhost.localdomain>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_212050_037582_F22B6AF1 
X-CRM114-Status: UNSURE (   7.41  )
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

Quoting Yuji Ishikawa (2025-11-13 22:53:58)
> Remove the definitions of number of clocks from bindings because they
> prevent adding new clocks. Since the previous patch removed all refereces
> within the driver, they can now be deleted.
>=20
> The same for resets and plls.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---

Applied to clk-next


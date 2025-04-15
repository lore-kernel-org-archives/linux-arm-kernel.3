Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18667C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 00:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8pUDLjTJYg0M7lx8nH/iZVN19UT7IjeebixwVF3GWo=; b=lRikmTuEiWLBftPPX6LemfXLD2
	7o3qPSxuChwxTHe9btscBmI5TJvWRkLc4Ur9PQf6qiKIbnzGBHzsJe+GMUvfDY0c2Gv8a0C9d54MC
	z2CQkVJSA3U7ScZZM686t3qLlmE6ErO8+e5YhSQ5StjEiJ0bH6eO6VQYr+ZisK56ly9IK5LWWIlqu
	QKsfnDZVu1Sm8UKEEPQL1xI84qgKuI6g01WKL40+yDEwAqEiNiXTT44vW+f2qALS2pP1mV3D5Pu0q
	vHdFXRG0xb5Pz+jM3kdjaavFNKRACmMA1q4ipbXX/4pS56QVyLPuowejypZzen2r65KONX8pRC4Ql
	0ogUP2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4U2h-00000003yiu-1B79;
	Tue, 15 Apr 2025 00:20:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4TzG-00000003yMO-3SvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 00:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B67D6A40A02;
	Tue, 15 Apr 2025 00:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86F5C4CEE2;
	Tue, 15 Apr 2025 00:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676233;
	bh=u8pUDLjTJYg0M7lx8nH/iZVN19UT7IjeebixwVF3GWo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GmOc4dKxSbt8DH+9plUWbWoiDbdrlVcVnMOzzA2tON8bTTt0aDzKDCJlFQ+878V1Z
	 rKo6oloFxv/lapdi8ojCoG1XgUd3PWBYWBAqZ0imC30oBzJjJKm+1/wx8tlGNZTkrF
	 kbu301SZrXLy2IHWY8OzqtEw1W84WvycbdObw+cduXEJ1Ro5YvFVO35aEVsyjZPmDr
	 S3fpPVH3XycaUiWck++UnzrgwjVWn0qKEdPhgXVcphQ5TRUGGUIcqbxuJLzfg+VlpZ
	 XG3ENnEjgq5Od/LVCUKq5VluxXKVH8+26GbjFThuCAu5+Px0REO/7CwViOqMD0NY/8
	 BmCtSY87R/8bQ==
Message-ID: <8494f5e76de6544e3d83b5b763ca42a2@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250409-spmi-v4-2-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com> <20250409-spmi-v4-2-eb81ecfd1f64@gmail.com>
Subject: Re: [PATCH v4 2/3] spmi: add a spmi driver for Apple SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, Jean-Francois Bortolotti <jeff@borto.fr>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>, Sven Peter <sven@svenpeter.dev>, fnkl.kernel@gmail.com
Date: Mon, 14 Apr 2025 17:17:11 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_171714_944384_69B63BC3 
X-CRM114-Status: UNSURE (   7.75  )
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

Quoting Sasha Finkelstein via B4 Relay (2025-04-09 14:52:13)
> From: Jean-Francois Bortolotti <jeff@borto.fr>
>=20
> The connected PMU contains several useful nvmem cells such as RTC offset,
> boot failure counters, reboot/shutdown selector, and a few others.
> In addition M3+ machines have their USB-PD controller connected via SPMI.
>=20
> Signed-off-by: Jean-Francois Bortolotti <jeff@borto.fr>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Applied to spmi-next


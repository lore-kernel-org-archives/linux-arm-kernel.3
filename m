Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D99DD6A22D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mjzFkEkJtHnZspQgtsajvCHGdLxhnmxNqfgsXx/HVQ=; b=Zh+Gd5jnoVQID0dKYEmkaeQ5Gp
	JF3NTjqpOet5vnfGvE4cfP7urO00pN3AJP2rpW8x0KyWxW/gDHBjzMxKLGsyrA77Y1s75eiERf0vd
	G8AGoZOCoKnc/C4enW/579dPH9hlLydnAR2sJ8Auf7+TZzemEj1wYrjWxWz1CF9ktvPc/KsGd6Y9h
	upOA1tBMeq2qMZEQ7AP85sbEjkZcuPkiLeUsLy+3rtOo+ln2EeI88LiAP5Uh/G2NOI+dyQdEeVXkL
	0xi4xtWEFGc+WQp+yJmvHfahh5nCZjkiM6Dtq3PUN1RkLxKLYouaaDRSfL3kHI1pEeQQc7zSvBugB
	J+Zlwltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgrj-00000000oKT-2lHQ;
	Thu, 14 Nov 2024 20:54:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgqo-00000000o5P-1QyX;
	Thu, 14 Nov 2024 20:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8FE20A41B75;
	Thu, 14 Nov 2024 20:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23696C4CECD;
	Thu, 14 Nov 2024 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731617641;
	bh=9mjzFkEkJtHnZspQgtsajvCHGdLxhnmxNqfgsXx/HVQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bqTZ4yZkew2pOSJLPov0I4RZaLSSs/zjoDpjcca4j9xbfcBP/HPQ7R50GlHchaPrp
	 YA7p2/n1oakh92qUR80wtiZB/UAcb3DVP9F5Y/ARKhkEQrMeq2WPDU1Zd5A/7uTF3n
	 tHAAgnNeBthI21C+WuYXpw419UZkO+kMupR7RI8tmgO6SNoQLG63MaJh9YScbzlrWs
	 klFg8RWKUlhyrj3Pf/bvs/kAgTYLmEf4NtgH8qNVfmxLqnAuYrMbJ4NSHnm2dNQKlK
	 z+klvgeexwyR9rvwqq8o305QZO/KizN+S+jYS7ZamPuzl+F+YPpeoT3FYDQmg/L3ld
	 FuIFxwwq15tkQ==
Message-ID: <d716d4e685cc4a88203ee25de3865de1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106111402.200940-3-y.oudjana@protonmail.com>
References: <20241106111402.200940-1-y.oudjana@protonmail.com> <20241106111402.200940-3-y.oudjana@protonmail.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: Add drivers for MT6735 syscon clock and reset controllers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 14 Nov 2024 12:53:58 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_125402_443580_A774F68C 
X-CRM114-Status: UNSURE (   6.61  )
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

Quoting Yassine Oudjana (2024-11-06 03:14:37)
> Add drivers for IMGSYS, MFGCFG, VDECSYS and VENCSYS clocks and resets
> on MT6735.
>=20
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---

Applied to clk-next


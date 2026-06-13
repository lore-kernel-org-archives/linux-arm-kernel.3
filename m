Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E12CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 22:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y9czviEfUCs9RDuFGMQRHETjuWFS4198YhyV0ORENA=; b=1Dl5hfH50AZSjhnJ+zbtLTzr2R
	dogenfmlA+sSSey0g3wdlZ1EoW89iOswt6wXQGgWSk8OJDniu4xu4UFQQ94N/9iZ5l6EmEaRQxudb
	ATj1GVvoL3rnz9OfYIzQnWE40SQ3Gj+KoC5vhMtTMyYFDKoemtuuIlijCLNZ38HN+GrjT40Fh3/Fz
	OWAGFHaEOprfRuNSwazWeAszSJ8Vnldtyc1g3Ah+85KjHmjrUyj1q6V6mzUlj/MCo8/YV+PlC7Qkr
	hoXMOd/+iSlR978MLDvTdSHTEXfBrItExsw93LPtDcfP1j7Ez2QGkVunqtWl70b4Ii2T6XeP6hSY8
	0jrU8SnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXGX-0000000Cave-1Sf6;
	Sat, 13 Jun 2026 22:55:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXGW-0000000CavQ-0sQ0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 22:55:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A886560142;
	Sat, 13 Jun 2026 22:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9EF1F000E9;
	Sat, 13 Jun 2026 22:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391347;
	bh=8Y9czviEfUCs9RDuFGMQRHETjuWFS4198YhyV0ORENA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Bsnum7D3HeZqfpgRMb8xikPmhEOVSat1u5u8opBITtAkcWMVEgAmbJgdLsHq7gm/C
	 GMVOCc5iOJ6jFCJ7qv6zS6rEHeEJJMBqQXPdLKlFkZhXqtLzOA9hb6tn+b2pCeQUTi
	 PoWfjMhuLVnSnUpiLtLeZdPmJViT3Xm8rGx75r7X/5sr6vfkFtZODbd+V7/PtWoLX1
	 9/A1dWuhmiU/ECglT3EBs8OaVluvPzgEm8l/S8tftU/3QONSn3R4M02BSDxEmHKK+a
	 oS32GjUUZvLkNKg+F/UN96HtdmmCZxRB8GapW3jY9txi+akDib6yVC47zCGqe28M7z
	 bXhuA4iwzrpWg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260612224825.852551-1-andersson@kernel.org>
References: <20260612224825.852551-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Luo Jie <jie.luo@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Alexander Koskovich <akoskovich@pm.me>, Biswapriyo Nath <nathbappai@gmail.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Phillip Varney <pbvarney@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 13 Jun 2026 15:55:45 -0700
Message-ID: <178139134534.819343.861205819784064327@lazor>
User-Agent: alot/0.12
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

Quoting Bjorn Andersson (2026-06-12 15:48:25)
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-7.2
>=20
> for you to fetch changes up to e108373c54fbc844b7f541c6fd7ecb31772afd3c:
>=20
>   clk: qcom: regmap-phy-mux: Rework the implementation (2026-06-08 09:17:=
24 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908E7D40D0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 23:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEYjQt96lWPstoeShAnU3G6jnpHJasceNuOR+43Qjrc=; b=A5bdmzNsN4NVQKXBGw8OnQciub
	QYStRZj5cEwdkDs06W9i9d8Nrkqy6YBAhDIsiPZDlW/d+/fLaaFrE8FuKbS8vHuRYsXDy4bPKaLPz
	R0r7gZ0GzRcwQxyW4Arhf94aEDugr15LZ/qzQ5ROfyBjnoTSx8gFCiIBtd8CX0Dl8I7kTmAzQvCMM
	1N54l872AYVJaCKCv/V4mKRSvsIrLtGuf15KpD2kx4xHiOBBGJrvMRd7AtQeVoXMBq+d5PlvpjzSL
	OAYb4XHZOntEVkvQU3N8VhYKGsCtFZdOsKepnJQAv3It0EfHOk0LZcIUTai1egjG+7Ad0msjZ2BYb
	RtLs0XNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8TN5-000000018zg-13Ri;
	Tue, 05 Nov 2024 23:54:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8TLM-000000018p7-3t8S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 23:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7A9EA4009F;
	Tue,  5 Nov 2024 23:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D414C4CECF;
	Tue,  5 Nov 2024 23:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730850735;
	bh=9wnJ/RDSeWoiJUdNP0Uow5AMHKmQWu2URfnoiruZous=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HII0ydHkTOJjKyLQD+5PEHXMwKiTCmGDEzUyDIVmIcY8L3F47Els3NVgs9fKonfqM
	 N8IOZYmH3+fz+SpLRFljKaWy+/VpMf5dOu3ttqtSqWT+gTd9/tRhDtS+cHINKLMSZ0
	 CEKhy/RKXfw2tUzWN/Ldlu7gY3FB5rGdzmH6JNxfKr8OpM2y4JDpbrGGiychrTNgZp
	 hJWMitPckffcqu9U1ZXs0UOXhppfvtZnWaYcYPfPxFms5Gj9NbylHrr15Zp0FM7mW8
	 jNhrlkDdVW7L76/lqyyhm1GOMCwfYAnPEKNTgQDdh7KeedJsGIF+U5vxkI7ueEQt+U
	 sTdxfyagDBE3Q==
Message-ID: <b312fadeefe5b77b8189f11570e0e109.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241102223956.868257-1-andersson@kernel.org>
References: <20241102223956.868257-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v6.12
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>, =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Johan Hovold <johan+linaro@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 05 Nov 2024 15:52:13 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_155217_254539_6C57F6F4 
X-CRM114-Status: UNSURE (   6.28  )
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

Quoting Bjorn Andersson (2024-11-02 15:39:54)
>=20
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-6.12
>=20
> for you to fetch changes up to e7f37a7d16310d3c9474825de26a67f00983ebea:
>=20
>   clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts flags (2024-10-=
22 15:35:15 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes


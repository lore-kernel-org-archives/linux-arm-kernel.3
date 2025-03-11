Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64EEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Dtrzdo+87cZ5JLmTTpg9Kdtv1Ks1mHz5cQa16uMWPM=; b=4eg0YQ8hSp8YZZR2f0bYy0qcyY
	QzgjrimFQHzxViEMDsgdGcEqShXDLE32Mlb4DYV/VdmdclidCvJK0gyyLTgu6qsO3lherQKFjGKEr
	PRx+zVFVgItcfmoDmrC6kCc0IKiF6Xt25AQBUKpefH2ZSoanwQJOTcc/Bvxm9gm5MCHwIQ+1wwHvQ
	w/IiKbUrTH8WnzCfHfdQxp6DM4fgxIh5p+ZaBcD26Z49Vz1MraLluOkrbP8HvqCAioL5j7BaV/inU
	hK8p0YRRW5CVIjshzVQtl+cWuF/8bnzp4H/Sk9M1iJRIugw/ZM92NI/XqHrK5GloyKCbmVkzHfGVO
	BrkwkNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts43Z-00000006ZSL-2sD0;
	Tue, 11 Mar 2025 18:10:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3kc-00000006W9E-0Zzr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 17:50:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FE115C5910;
	Tue, 11 Mar 2025 17:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B995C4CEE9;
	Tue, 11 Mar 2025 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715444;
	bh=kLDi5hF86QZHs0p/61H7Td0DURnQ7im8mU8C1Zlw5zc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kx3NZIpjCvLI2hwgQQoYXNSbKXDaKKrlYc/uCkvVV7Au3BREVHUEsJCedXDxXcDQy
	 qqBuUAmxNnlFWtF1UJCjNKqXSpCdqSbe1mJKLlMP9KNABs3NeJc1MUDm25QdgGLl4r
	 dogi2SccbC44QbWPOC8V7MJVAaHDX+JP8AKIz/9nfGTzWMM43Go+7m20GhHEYrYjpZ
	 0qoKTDlBOBKSuYTjK5262Dz20+vzBxL+HVq5fX5z6pjxmjMunPAO0L6NE+XLtCR2I/
	 /px7Zu+XMgfpSrXVw4wHkMbR09nGaWFK/PgmqtMwRqb4uyWX1k9+nX9P8cvOv7LBT4
	 n2Embdqv9zxKw==
Message-ID: <899b71724428aaa16d424f54d5b1558b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250310191142.1208155-1-andersson@kernel.org>
References: <20250310191142.1208155-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fix for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 11 Mar 2025 10:50:42 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_105046_230344_AE3B96C1 
X-CRM114-Status: UNSURE (   7.32  )
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

Quoting Bjorn Andersson (2025-03-10 12:11:41)
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-6.14
>=20
> for you to fetch changes up to 787289a1d13d50ff4ce0f496947f8817ef3fdea9:
>=20
>   clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte in=
tf parent (2025-02-26 08:57:46 -0600)
>=20
> ----------------------------------------------------------------
> Qualcomm clock fix for v6.14
>=20
> Avoid propagating rate changes for the MDSS byte intf clocks on SM8750,
> to avoid changing the already configured clocks.

I already picked this up to clk-fixes a couple weeks ago.


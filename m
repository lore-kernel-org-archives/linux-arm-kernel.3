Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C1CC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 07:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO4P0vowkLL+lTyaBJnDazWD0w4ikebWAT92MerApdE=; b=e88+HoHPtTMXfkKFidbxQnc4/f
	KJmEOQiiS4ivtwX4jqgsOjA0GgLYhcy9/I0HqoaSlEpjluL9zD1RmP1ru/PM1fPGNy6yldQzMN74A
	I/cN8mdHDYamDrEEpBwyuluIOx6doA1STECLpk1xHYEhmkHWtgVizd9HkUNgzUpCfXFNTbnAuCL2t
	1ne6+n56Sle6JtU6RQVZ5G+SZG7NiOsSJeRhSPZVEcTqBa4y6/VQe0j22+bPuj00Dgv4Z2VEazDnV
	MQ5biAOjXFANFqdGknCho2DnBOwY3D11Ng3NQeti/WR5nsDQ4DNEzAO5Ah/6/VgfVrSW2eY4jx3DI
	C3JyX4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKXHz-0000000F9cY-052l;
	Thu, 29 May 2025 07:02:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKWrB-0000000F5iw-1Yd7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 06:35:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74D8844105;
	Thu, 29 May 2025 06:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E0BC4CEE7;
	Thu, 29 May 2025 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748500512;
	bh=W59ukfJHiYDFA5z+8vL4wXL+O4w/xl5nJwOF60dMww0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gkQfSDMqKVC7lzSMyTe2DlmLz2CRaT1AEVdTBtsX2j3pwRDXi+Hn54Glm7/blj9Dr
	 vnBvqS5lAaxEW/wZ53BzH9+jW5w2xUTG33M7Y6RRHBGS84SBsuHwsdt1guo69Bgu6a
	 9uZ5uFi8pi/PSDR9Zd0PAfJWlWFtKWP6rFGZlXz2WUiFOEwhhkguPQSuempE5FyK2r
	 o5VjPD1r6Ug6P2hPmCuIh+oZ0WLVnhxfQm7MSP6yv2lCjeO4S3+eOcZ/R09YVaQaa7
	 NmriDfP0D54ARUnMwvBkd95AGY9SPP9T9b9t6es/lbn+udX4zkHfCKSTtM8wltc3dk
	 FqH/oZcX3VA0w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250524021610.18621-1-andersson@kernel.org>
References: <20250524021610.18621-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, Taniya Das <quic_tdas@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>, Vincent Knecht <vincent.knecht@mailoo.org>, Wentao Liang <vulab@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Wed, 28 May 2025 23:35:11 -0700
Message-ID: <174850051136.12717.14153102591884762560@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_233513_431951_890FE4B2 
X-CRM114-Status: UNSURE (   6.27  )
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

Quoting Bjorn Andersson (2025-05-23 19:16:09)
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.16
>=20
> for you to fetch changes up to 201bf08ba9e26eeb0a96ba3fd5c026f531b31aed:
>=20
>   clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks (2025-05-17 =
19:28:40 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACB7F3ED6A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 23:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rz7DNWj9GD9wJZ1juK0eYXE0cReptAFlQBRobRf5lHw=; b=NKhNH6xCjAtAQMBJVusra0nP9d
	a9T69Aj5OP36CWgM/ZwJ48CJAUmTh2H+IEVa/KufDUWjZBYuXiEMsKwdAKrZ2bVg6MTzomc+/y7GT
	olosaBUCK2mBJHDoBvwYBnYD8Gr3r2qCZRrwpdVyl4yw6lScPqUla8sfBz3eX3D8pvRBmVb5A3ZEt
	Iq8cPaRsdSWirxYWk6QJsqGocBp6BOXuV/wt3DHBRX4vXsA3xAttzsYddmWHMHhfNfddmq4fkgMmR
	09zQW5sdH8zDzsMENm/8eK8mcFExGqOm1Nph8RQ6sSyVJ7CDr911Ylj88NVOALcwLnMcb2yD8W6OS
	80stToxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhrr-0000000DsqV-3RLt;
	Sat, 11 Apr 2026 23:35:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhrq-0000000Dspl-29Jk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 23:35:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4118D6015B;
	Sat, 11 Apr 2026 23:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5EAC116C6;
	Sat, 11 Apr 2026 23:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775950557;
	bh=cpxZ95ovVNBn8+qnolclvcKra4Be0iJWKicAp3XsLOw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Gm9juqzuWxcC5ocRH1Ej3PaO/4Y16ZDa3F89i/8BXy5jC6ml43Jxdpi+sm05gqZYU
	 va2uQ/4zd/EZESq5YK+ITiBLZ4+Ikqoc90PqiRjZ8w7aYjdHDtjSR6D+yHMjyiuOIt
	 oCucIz6Gz2uZVLHYJTYGb0PL/lEeQclloyc3IXEEJS0MMYN/+UPW/yD4/kQrVwmEMJ
	 cChanrabpqRw3HePVGOmk30nfZvZo78Zm8sr2ph22D7LdpRqTS/RNy7VtpeD+gFN0o
	 YJMYtJ9dXvTWqX1LAbErCsBhJuFR+QlTl35Mv6P5QRlT7ZRHpv3EFXEryDc/C0Xqzw
	 Uhkv5xKyBeVRA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260410223840.3976134-1-andersson@kernel.org>
References: <20260410223840.3976134-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <taniya.das@oss.qualcomm.com>, Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, John Crispin <john@phrozen.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Pengyu Luo <mitltlatltl@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Prasanna Tolety <quic_ptolety@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, White Lewis <liu224806@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 11 Apr 2026 16:35:55 -0700
Message-ID: <177595055509.5403.7319021018800938492@lazor>
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

Quoting Bjorn Andersson (2026-04-10 15:38:40)
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-7.1
>=20
> for you to fetch changes up to a4f780cd5c7aa8c0d2d044ffd153f7a3a13ca81e:
>=20
>   clk: qcom: gcc: Add multiple global clock controller driver for Nord So=
C (2026-04-08 21:00:09 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB94D60D15
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 03:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyYD6eML22QhKHsF1CHeRsnOHX4JqzA+icG3EtNc4Po=; b=UzxpvRPNp/nDxOReAH+KCAj1Ip
	v8BWpwJsFycnmVo1kpfy+l9+kzTpN1x21Pva1NKmaHEZr5j6hli+rErFR9y9Ipid5UcBcmW7aio6O
	aPcTKqqsDT4kgR0dfmbSKmBCB6C8T0gXaXbXe1A/PUTJkZQAWBbnxDVuhPOjLNDizNyPYaalOj7MY
	WjNmRdd0bp1yk12UIJBFMuK4VVDwdHwWYb68pzC1gCr6UfM/Ca2SHVp5DxRG6K4YtEjmSX52KGIgJ
	NBM/nXYLyTT6mDBm2mNZuYSzGlF2VrKEOu7lQQBHBUKWlUiuqjB2uWk5Ld0p2o35R37NXBQBcldns
	8y1gF1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDFE2-0000000BJ0q-061e;
	Tue, 19 Nov 2024 03:48:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDFD5-0000000BIxF-3RwY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 03:47:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91B075C10D8;
	Tue, 19 Nov 2024 03:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E8FC4CECF;
	Tue, 19 Nov 2024 03:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731988046;
	bh=RKLamRwBayIwDIcA2zlPwWfk0nYyiCevvGVdQc4QLko=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Mwj0WlTaEgRMpDPDtyTSjZOeUQcjAwlai3euRxpBQC60iZWIwFkvZLfkkYog8Hinr
	 8oSF/VuT3hVS5mc2pxiP/FhekFtNtkMZlcqBIAxXPGOB+l/kAAv36f98R+d3mw8MPD
	 he6/XCTP65tMud2UizHNrSK4ngrQmwx275y1ErGrxCmo+JxefpVmYcqI0f+DmWCdZs
	 +yGG1C8jYh0/+iDsVa/Lz3NiWQEfV6+yx1BdD5pEeFsori/W1/dYGSaREdbrwEHDcC
	 LXfRDX9IuwWh+O/fWwp++CRXJWcy7JwAuVHQJomzOoydIYelUIuoguSbL5+cDdnofu
	 4xmioD0tsxWDg==
Message-ID: <943d74eeb9ef087832404a583f4f7d86.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241116163854.122610-1-andersson@kernel.org>
References: <20241116163854.122610-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Danila Tikhonov <danila@jiaxyga.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Johan Hovold <johan+linaro@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, Arnd Bergmann <arnd@arndb.de>, Devi Priya <quic_devipriy@quicinc.com>, Gabor Juhos <j4g8y7@gmail.com>, Jonathan Marek <jonathan@marek.ca>, Konrad Dybcio <quic_kdybcio@quicinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 18 Nov 2024 19:47:24 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_194727_904315_23485CD0 
X-CRM114-Status: UNSURE (   7.13  )
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

Quoting Bjorn Andersson (2024-11-16 08:38:53)
>=20
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.13
>=20
> for you to fetch changes up to f1f49cc505bc998d7c13e5a518d027419a21fbae:
>=20
>   clk: qcom: remove unused data from gcc-ipq5424.c (2024-11-11 21:57:38 -=
0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


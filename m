Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A31C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB80dA7/Q6KTTBkjcFz6I78DKxK0OVm63LLi7zqN0r4=; b=wNNBYTAbbbX2KUCbBoYn+lNyq+
	hNzg8in/4GQ+HMBCBH0OskmjBtTSvdYOHkK8RKJpkgmz26EkIuASFEsuBQ0OggknPS4mSPo3zmiJU
	BplH4dMeVPOOKRARFw4SygW5XokWm8ktPYZmzP8VqHqLIgQDBIVtkNYcPG+h9eU29v8xJs47pB/H3
	UY4ud14ziEp4QWM/oBCe3Qee6VqFj11vMqavGzDMRhZ6dtY5h6YZLm7KrAjZ/3Tpw5OKSRUsfGjKY
	YH71yNFMZYE7HwFMaFsgIMw5646897kVijN79IohSMC7kT9rtBQR4Ql5Lp/qdEil4mIVCvnH5l8XF
	uADPL2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPPS-00000006Fxy-0das;
	Mon, 13 Jan 2025 18:43:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPKU-00000006Eay-0N4u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 18:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AB575C5777;
	Mon, 13 Jan 2025 18:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EFEC4CED6;
	Mon, 13 Jan 2025 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793504;
	bh=5J/IBxz8Z/k6WFcryDdFs/+RqAk40joH86YjsR9ymeM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MnuilxLDrXrymEHAZG0E23UA+U1JVHl1npqZZH1yTfqgPh4QvQwGnp6h8Z1du+2gv
	 CDosLDcokny5vbpdEEpfOAx+nNitETNOURs7HE3f14vmaI9Q+aD91DD5HRIEmEds38
	 dn431Z88WFcbWhGHf3AwS4UhhRvtuu3r/HL2YNXBDXVgjTOkzTlQ4GP3L4qqoe8iM4
	 kU/KwkRGurXUu/0xICdLasLcm3ebKQxdmuhRzKirMHEXysJshVyMTzRCsNwArXSo7r
	 chVPnokXaEVsR2WTY1FskEozuAwQ7rZyEiPY/W/XWY6edcAQLT4lI0GR1gONkZqK3/
	 x8ogU/YGbf+Mg==
Message-ID: <b0d029d67870bebefb607b8584dc36ad.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250111181938.395276-1-andersson@kernel.org>
References: <20250111181938.395276-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <quic_tdas@quicinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Gabor Juhos <j4g8y7@gmail.com>, Daniil Titov <daniilt971@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Dzmitry Sankouski <dsankouski@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, Luo Jie <quic_luoj@quicinc.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Varadarajan Narayanan <quic_varada@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, Anastasia Belova <abelova@astralinux.ru>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Richard Acayan <mailingradian@gmail.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 13 Jan 2025 10:38:22 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_103826_166844_41533CF5 
X-CRM114-Status: UNSURE (   7.04  )
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

Quoting Bjorn Andersson (2025-01-11 10:19:37)
>=20
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.14
>=20
> for you to fetch changes up to 5e419033b5cb20f9150bfec15dc6cdf10049e654:
>=20
>   clk: qcom: Select CLK_X1E80100_GCC in config CLK_X1P42100_GPUCC (2025-0=
1-07 22:45:19 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

drivers/clk/qcom/gpucc-x1p42100.c:42:22: warning: decimal constant 23000000=
00 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 com=
pilers are very likely to produce unsigned long (and a warning) here
drivers/clk/qcom/dispcc-sm8750.c:79:22: warning: decimal constant 250000000=
0 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 comp=
ilers are very likely to produce unsigned long (and a warning) here
drivers/clk/qcom/camcc-x1e80100.c:47:22: warning: decimal constant 23000000=
00 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 com=
pilers are very likely to produce unsigned long (and a warning) here


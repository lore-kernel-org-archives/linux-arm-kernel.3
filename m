Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2109BC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 06:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLJC/cRBUOxmekiLdYNbZ14vSHrKhjTvId+sFKlHECw=; b=Y9UU8EHM+Abv8UzDBuRQAMYtDZ
	TDE2N/ZLobqyHaNm7hKAeHRcbB4+5HTfpUUnv8kj7HVRKnuNaVcOUkNlra4FPyZlYHdfLc4P3+qEc
	RTIlHKuxUyBQRr/mL2c8bVjIcz5n9DVxwF2eZYs9isyYL9hU0uGHyfDA/fVYSN3/fY+yFJi/bYdHV
	yuWYjrf6/vqSODl3IDoOAMB/OV8eySoDKT6Uh7jtTD+DPqIyC5RLoPOBss2ZJq26lkQ6btoy1Cs5r
	+IzMqdWOYaTeUsAHYRrfE+qvQcthP9sVSRAgk71s15HS54ci0VD9pktEPBRyGfN9Zl8C+b4BXISgr
	l5CGhOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufvEK-0000000COid-19CP;
	Sun, 27 Jul 2025 06:51:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufvBm-0000000COcN-3ktV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 06:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C174943C75;
	Sun, 27 Jul 2025 06:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DBBC4CEEB;
	Sun, 27 Jul 2025 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753598932;
	bh=FPkM309Se8TKNOMQia+CHlwJ5P4QHlEg39teSfFx7MM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cfbkF7ytF1GoiRWGm2JGpC/kksNoGJL2BSC+NgXC3l/M8Px90XwJrYytn3GM9a/Kr
	 uzgBmksQu6wASS++VRi3LW9zhx3y00d9rG0M38+sEs6eg9+LFjPnYyAkUNuw91rWH0
	 X3KSsdZpFmlmwukilCLqz8ov3f7hOX4JT7WMaJBQynTKsjBxj4DG2Zx7aASdwuMGFc
	 r4mPlb8XkY00zInr2U3LJ4cMt/PdiFr/T0tGj/XoPGA2jkCPMYlhYJZscI3PehFbzc
	 LzxD2+U6N6qvp0VYODMYvMUBfy/pF/Ae/mnqBapkNPcCTjc1YPnWsG0hu/gXj5C/HD
	 5vo6pWntBDwzQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250727021756.657115-1-andersson@kernel.org>
References: <20250727021756.657115-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updated for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Brian Masney <bmasney@redhat.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, George Moussalem <george.moussalem@outlook.com>, Luo Jie <quic_luoj@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 26 Jul 2025 23:48:51 -0700
Message-ID: <175359893163.3513.9647317962157940113@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_234854_955953_29179EBA 
X-CRM114-Status: UNSURE (   6.54  )
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

Quoting Bjorn Andersson (2025-07-26 19:17:55)
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.17
>=20
> for you to fetch changes up to 45dd59885ca8d283f365774a82b9b785b65c8d37:
>=20
>   dt-bindings: clock: qcom,sm4450-dispcc: Reference qcom,gcc.yaml (2025-0=
7-19 22:42:28 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next


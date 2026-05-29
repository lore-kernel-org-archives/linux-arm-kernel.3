Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D2ACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 01:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBm/saWMSnvcWJK0srDmWF64YvRSAgnNDoEaL6eIWLM=; b=Nwp1awiiupz9/pCEwIkzVHs1D6
	ZKH91y4xE2JuoROuGsvNU3wWmgMHVhpiiHn3IH8gan5+91Q5wfQgYRCUy1Mc389MNIiqtDOsuQSyT
	6PFbz+rjuhPf22SPSORf5808Q05d1SSOKNiyrCmn+jGKc7R9m3Hu81D8xpHc2xK4nFNltH6twc+lS
	InQR47lL/fAE2HOOVPFDS6PMcJFNHd7/0EOU8aAlNfNYaIpZ1brQnSqcVe3C4q4On+oear7Fb7q6m
	QlRRX9A37/5rfNQ8DtLUDsRxMRN0FN28afDukJaki8Co2LHxPk9jZA+iU7UipF8yIJscNWnhMwRQP
	jyw0RPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlvd-00000006bjT-1avL;
	Fri, 29 May 2026 01:22:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlva-00000006bj7-1cLU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 01:22:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A6A44194F;
	Fri, 29 May 2026 01:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14F61F000E9;
	Fri, 29 May 2026 01:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780017741;
	bh=nBm/saWMSnvcWJK0srDmWF64YvRSAgnNDoEaL6eIWLM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=n7ixbxX6Eiek901hoLF6lO4mfTy80hPp2QdMjaNYt0Vke97S+WAw8XuCSgIr8ipqX
	 fY937+M+benJVGfsAK7cp3FCx8zIea3Ut2pLiRBMsbcGr1kanX+JOTLT2OmN0rwBoW
	 /iO7VZUhv4Clxkzgt46g7KzzMw2k9LZoWHoBy10h17jAiyKAozcLM44M5lYRWhsWwF
	 VUV+xeh7Yp8rAK/3VJgQLtczuWj9Z/jm6ZdrRCTsHuyZzjuw7NyFBcmopHdD8x2vwZ
	 IR1K/apfvXmyVg61ibrySf8JLDJkg2aPOeJc1204nrqppMB5fnWBpf4RklDwFw3Ro/
	 t7icncf/bhFUA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260526150454.4281-1-andersson@kernel.org>
References: <20260526150454.4281-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hans de Goede <johannes.goede@oss.qualcomm.com>, Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Thu, 28 May 2026 18:22:20 -0700
Message-ID: <178001774018.5961.10942896930927860509@lazor>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_182222_464259_D7ABA0AF 
X-CRM114-Status: UNSURE (   6.46  )
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

Quoting Bjorn Andersson (2026-05-26 08:04:54)
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-7.1
>=20
> for you to fetch changes up to 5285b046757844435d1db96c1b5c3a6621b2979a:
>=20
>   clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time=
 (2026-05-21 22:45:49 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.


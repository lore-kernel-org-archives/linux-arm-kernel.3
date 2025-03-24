Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F519C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 23:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jZkJb/+ek8LGDGFEJR6MVBaPasIlM4WDyFBu+J47F4=; b=eYYfFBUvx1KdFuDxPAv6ZiSe0g
	r+d69vI4Zt7xWCBD1WnuK1jmOJ7id1HW6wQj7VOHFSkl70ZnyY7YrrcJghsCz/krmi85Lst/El6si
	y+DNLDiAAKGiQMLvX852WaZHIawoVNa9ULlmfQaROI6oyXcxGUaxlfnVuX8AtwRV76UXhnI+LdVho
	NkMH+ElWviN2qzb2emVSYNU5eXBnnltMwyiLxCcFNJ7yh5QyiSM36XE344pLsq5PQ9l8HA/rr5Dsj
	S++n3P2O47mSfbJV/O6JKoUvNP7AY5Qn+fkN2VJYPAQnejpRDcHcKhO8XJ94f86/iZs/YASoDvGr+
	8zA4gRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twrMY-00000004UbK-44Mt;
	Mon, 24 Mar 2025 23:37:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twrKq-00000004UYG-3wF9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 23:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 019D75C4815;
	Mon, 24 Mar 2025 23:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8727EC4CEDD;
	Mon, 24 Mar 2025 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742859358;
	bh=Rg0bhVS7IXPeDUaqm6jbmcJoYDANFRraWn+5Ga0k1X0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZtxInX6yQsCPOx57XwUDwrJN69cDO7Lt9T41YjfV4VNQPRBLyucbLttuvCe4KPALu
	 WBqyIz5pQRbjrwTq9fUG3+fX2yv0rltUdaDhT8hIp/gGfrinKFEgGSberA4J67hWqd
	 rehYjqNsFZzo/ZgjZDeFXTa7mj9jDCkwQPn5q4A0M3M3JiTUhS6XhQF+DJVyvZjQp6
	 lOYR3bEkeraKmYXrBlyNi/WpclKCTepgwCAGBGOT42LTisTGMewROxOYbGaLBLhJ8j
	 3S1WoX9H0iVECSyEDYWp9A9uAzs5rdkPuLvfAwH45Z1U9AYMfZifXoxGvgQtQtSOth
	 5UI4DFUZRNinw==
Message-ID: <756e17f75d314afc8ce68b727fe2b115@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250322133453.2723879-1-andersson@kernel.org>
References: <20250322133453.2723879-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Imran Shaik <quic_imrashai@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Devi Priya <quic_devipriy@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Alexey Minnekhanov <alexeymin@postmarketos.org>, Daniil Titov <daniilt971@gmail.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Ajit Pandey <quic_ajipan@quicinc.com>, =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Jordan Crouse <jorcrous@amazon.com>, Karl Chan <exxxxkc@getgoogleoff.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Vladimir Lypak <vladimir.lypak@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 24 Mar 2025 16:35:56 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_163601_032711_53193953 
X-CRM114-Status: UNSURE (   6.36  )
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

Quoting Bjorn Andersson (2025-03-22 06:34:50)
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.15
>=20
> for you to fetch changes up to 9bf3684e0f7e65298ff844fd81e6dc5105c67354:
>=20
>   clk: qcom: Add NSS clock Controller driver for IPQ9574 (2025-03-17 10:1=
1:45 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


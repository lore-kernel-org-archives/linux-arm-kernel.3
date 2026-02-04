Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10370E7FDCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 05:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G45vSWRbRCkUWnQM/8wbjE1FVXep+0NcwI+paAa/oFU=; b=kkGd0iIoWX+BlBHQzP8iasu6OL
	FHU/pvHMBGKCNolMJD5WpMfP1O0q8S6H9LXqc8SCBXQrpuTRFBqylCYKSBEc8sV0YSq3e++l+6wmz
	unD9APhNn5zCeh8Z8eiw/2UpDp7ah8nxLCZasFKlbXww1JeXArujh6+t/BEqdXpXHlnGA4xOiyI41
	TkXmnBt+wwEW5T1t70w6lzAsBkKxrIV37Jf3xR7Nm378kcv3gwWsRpmfCFQ5DcQDDybhd+dvNNGSd
	vFLSDG6uLjBQkQZifJzlDPYRd94BAbv6Py3LwaG+f9KPjT77d9Nw1+GhQ/oO8urtf6VgbdEESubw6
	8IGxGsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVfi-00000007xSf-2OkD;
	Wed, 04 Feb 2026 05:43:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVff-00000007xSL-1ykS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 05:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92579444F0;
	Wed,  4 Feb 2026 05:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642D6C116C6;
	Wed,  4 Feb 2026 05:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770183802;
	bh=hIWpmD1HCFpynWwNa5m+qldFI0LbfUm5Dt12RIEDDho=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KZ9QLx38JOcuN3g1gQtvigNvWdT7DfdImC3orMh2SNSLwRawNtyHmdq8nDF/QjLJs
	 prIx/o0xa+3nEgAUP78eLY4G/y7CLArjmyMZNZaiZ6+t5BPWZEOJjvXQg2JoVvr6mT
	 SAMbYOUHJt7wFb7+viBp5IPRoxyVLhXavzElEZe8xqZ7FduE03hj7VJI2dPBAAJXaH
	 bxuniY2rOGuTzqbIptBygCL8bpPYQ92USfYUQHHH/VtwlpJFIYE63txkZU/jwBKmlM
	 Kqu4ReUMZcffubkPZTRqZKBw+AA7S+0ADYpiWczkk8vf8VvxBzIBLSQ2slcNuN25Yl
	 T6OLTYT8E8rqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260203171616.2830464-1-andersson@kernel.org>
References: <20260203171616.2830464-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Brian Masney <bmasney@redhat.com>, Daniil Titov <daniilt971@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, David Heidelberg <david@ixit.cz>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, George Moussalem <george.moussalem@outlook.com>, Petr Hodina <petr.hodina@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 03 Feb 2026 21:43:20 -0800
Message-ID: <177018380057.4027.13165930761947457447@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_214323_549820_F77E6A00 
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

Quoting Bjorn Andersson (2026-02-03 09:16:16)
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.20
>=20
> for you to fetch changes up to 012e012e4917da06b512a3074980c3091949befa:
>=20
>   clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc (2026-01-28 =
14:23:35 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0812E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOv3SDR/kqhF+2Wt+FhCJkbZftAkSUP5oWG1y/l48sI=; b=jKXQCPPrSrzZF7MTdDxKcatbm3
	1SbWHIqYqjW3CZ83lXZKWRVdQNvaSQcjcOa3YffHVfch/bf+SL0pUYfh9Fe3lRYqj9IHaANDEfwnH
	M/ClK7rKglBOhRCXZOyGnofdUYzcj8jfuT0XForRO2v7pTcrKlZJ5ZjmkjrzEYqNoFyWl/xAc+/DJ
	wGNmudbEns5L/v6stYOHV7KkfdDAKRCtbCImbK74oPbuTOdtMcZUay1z1uUSLeTo5GdJEdxr7XT+V
	TNyDKYoHkb83le/L6V32nlXVlfuszxYLBDr+EW2qRss+ELGY4/nu9dxv9pWH5Ga3kC9mG9SlmAENc
	Kw1x4zTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHbj-000000082V1-2swU;
	Sun, 22 Dec 2024 08:46:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHZd-000000082IE-2Mbh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 08:44:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 330145C473F;
	Sun, 22 Dec 2024 08:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E50FC4CECD;
	Sun, 22 Dec 2024 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734857068;
	bh=vOv3SDR/kqhF+2Wt+FhCJkbZftAkSUP5oWG1y/l48sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGthdnDRcHBT6b3R4o1mP3UcKjpM+zl5RG5Ukllt/4gA5pEjW0D0vyTHBGZvsU2OA
	 3/45fYgvtiBh60l1l4flqoNHeqX14AETyaT3PUkMxj6gcwfJvgZROkkvL0HY0fskMM
	 IB4tSWOu5kWd8tGV+pi31A5fg+hAptE0GhssY8JhDmdMOZOGHqcyABTpkng5H1BoOH
	 PgMOpigvpfXiC28Kf83cfuKhNxOs7DnD3/88fzxv20kQy4h3qOvP2qNdeDSEAoQIkE
	 7xYkW6/d2V9cOiZgJDjLP6a5CIOrGApq625iYx7ua6dTXxp4ezA28MQLErt5h+8RE4
	 tvpji0NCjYCig==
Date: Sun, 22 Dec 2024 09:44:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v6 1/5] dt-bindings: mailbox: allow #mbox-cells = <0>;
Message-ID: <uj4hxm6ijclixdq7wr5yfa7xnxjrom45ce7iyowf54kebkuelb@24ufqptjlwqg>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
 <20241220-acpm-v4-upstream-mbox-v6-1-a6942806e52a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-1-a6942806e52a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_004429_648284_ECEDFA64 
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

On Fri, Dec 20, 2024 at 01:49:56PM +0000, Tudor Ambarus wrote:
> There are mailbox clients that can discover the mailbox channel
> identifiers at runtime. For such cases passing the channel
> identifiers via DT is redundant.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



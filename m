Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DD5CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prisHkZFsumBlISEjbp86v+p5Me4Xe1CO3z5hU1zoUg=; b=4LzOtzYzpWZlDGFsoo2U0krsLo
	3xYqurLYGD00qQcZjhXPqipgt+aAtKAJYgnqPCfka+XB9Z6jLKSeMNXD/YrvKIyjmjowcJ4bgWtKL
	WN9GXhetHUZXvVZK20Y58zeYG1GbcY1R8EcsDbRs9Ebdpw0ki6j2OAZgM9C3TNXRuTgPRRsKdS/no
	d2YNHEuZjqdaWIFd0cpjbKMN87R1vepNpvbkdN3Eyrk3LKtFP0WzK6LjmGOG7rgb+a1TrV9nufp92
	W2hPMlN9zUONay8jAfgrQHUKODGcXkmk985QB34i/taDaXKVBucyPLrerFAk39sjxxj6+nwsfYJWO
	q1GiVD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3hW-0000000891U-1tZe;
	Mon, 18 Aug 2025 17:31:18 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo17m-00000007nca-1YRr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:46:15 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c5Frn1Pqlz9sbW;
	Mon, 18 Aug 2025 16:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755528361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prisHkZFsumBlISEjbp86v+p5Me4Xe1CO3z5hU1zoUg=;
	b=CWUCt99WERkMWk6G4EDiKPbKhhUHoWRRiDS6bNYPIA48IbBh7ljN7V+MRXGONqDOmm8iWs
	va+rGc/LuOiHIKMkLLdfC/GC/tPGrqihjB+S8IIUGfk+pbzQ8l99vHzXmXsBDz+LpGtr1o
	4t417sis4XnbF+XsS6JyespaleWdP1K6U96upKz60zufD21H0/S5J+Ztg+Ox6XxnCv/ewk
	YKK5EluLM1TqY3eHojWBsXUW9dqOC5+EB4OvAx3aoOnJ5fj2RIHOvYT+TPVZmkvI0Khi8v
	bl4YSjppcx+xz+l5OtXLlodJ9nfi5JeuHtAN1mDS+hOGNH3/AhxZ9tMNd69Pig==
Message-ID: <388e6f81-383b-4b39-9b75-8d2cdbf95d37@mailbox.org>
Date: Mon, 18 Aug 2025 16:45:57 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm: dts: stm32: Drop redundant status=okay
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com
References: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: coqxxm9yzunxshdnea793g9zi1nidobq
X-MBO-RS-ID: 7fe8b2a187d2927442a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_074614_558895_0612C1D8 
X-CRM114-Status: UNSURE (   5.39  )
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

On 8/18/25 4:37 PM, Krzysztof Kozlowski wrote:
> Device nodes are enabled by default, so remove confusing or duplicated
> enabling of few nodes.  No practical impact, verified with dtx_diff.
I assume the "no practical impact" means DTs are identical before/after 
this patch ? If yes,

Reviewed-by: Marek Vasut <marek.vasut@mailbox.org>

Thanks !


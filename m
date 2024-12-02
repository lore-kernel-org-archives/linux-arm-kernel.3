Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA1DD78336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIc8t4lKmK5UFIFirTARtrzWQUkYKt0eN41jarQxzs4=; b=p8LLF3I9RzqxpUM+NN4g/UkQfe
	rGqiPGx7dRF8Z/BZBUZhTPvB0hZQO3GpHnVaRWv+eQHF2/CbwU2KYmD9lFIr2i+L36yMcuyGfI/89
	S2bhzFxO/mfGooU5e4LhLcdYKd+wxdlKWRxuFEsY2J0nkqeyqyhwcmDTbpj9QKV+HB12qFfUGanSv
	zJeNS1/9xJ0Nps/2/Tc3Ri8ldt5PF36wRiyf03g6KcO1+e1YG6M2LGZ0izKAWEjcmWeA4KDTACGl9
	t6Di0lO2KcPTK2CI0iOMz5kz8J9fpq4hTFl7X0g4zEP8qUqIUQfR5rZpto08qYCR/kHO3zlnt+Xp3
	1SbD3pcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI97T-00000006obJ-3KFa;
	Mon, 02 Dec 2024 16:17:55 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8qy-00000006lFC-2Sa0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:00:53 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y27mP3Tlgz4wFG;
	Mon, 02 Dec 2024 16:00:37 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y27mF2LK8z6tkK;
	Mon,  2 Dec 2024 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733155232;
	bh=eIc8t4lKmK5UFIFirTARtrzWQUkYKt0eN41jarQxzs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kckp/CmEX++1vMkL4CETxaUQW9hRAQnBhErrEwBAFC9cZ0pM8rCzrx0eCOxIw0eC1
	 qwQXyb0whcyyGzRZq4kV7NoV5/D3MCMrl9zCIDQTOOVF0SlPivgRnzKYtBZDbARfby
	 RBqJUqnYTYI5IVzgWe1Kbg3VJc/cCtiUxpCp3H2mEPUTzxRqOFDKC0AUFrt6xnniyh
	 15M4PSOrPIHwgKcqvGT5vykUcMnxglK8jEJWO4HbfsUWMPBbD1Q4NPmUYVagL0EWGv
	 NsCnoXM3qPNT2IT0eFVxOt4YKBeBZzwdVNrDG9a0VBFq8LG7H8KBbrNnevcjRqmddf
	 cO+CDGxl8oaNg==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	robh@kernel.org,
	umer.uddin@mentallysanemainliners.org
Subject: Re: Re: [PATCH v3 3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
Date: Mon,  2 Dec 2024 16:00:11 +0000
Message-ID: <20241202160011.3232-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <88f6ab28-1b3f-4144-91c8-0131ee008838@kernel.org>
References: <88f6ab28-1b3f-4144-91c8-0131ee008838@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_080052_692202_92F068A4 
X-CRM114-Status: GOOD (  12.38  )
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

On 02/12/2024 8:53, Krzysztof Kozlowski wrote:

> Umer,
>
> I wanted to apply the series, but for two weeks you ignored this
> feedback/comment, so I am dropping the patchset from my queue.
>
> Be sure you respond to reviewers in timely manner (and if you give
> yourself more than two weeks to respond it also means other have more
> than two weeks...).
>
> Best regards,
> Krzysztof

Hi Krzysztof, I did not mean to ignore him, I had mock examinations coming
up when this feedback was sent. I had no chance to reply as i had to prepare
and do good in these examinations as they influence what colleges I get
accepted at. Sorry for any inconvenience caused to both of you.

Best regards,
Umer


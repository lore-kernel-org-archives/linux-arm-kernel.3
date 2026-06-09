Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379FBCD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQpu1OhWPmLhgQCfoB8dpZ9HJ92662GsLDeWYFfZD/c=; b=MHcjSbontsskcG2l8CEKxX60ye
	bnlo8LsDqmwgtyW9Ml0CV+7twauczZZA1UeS//8W5gqho3shM/qM6AThOdUlYfq/yj7daBXHxFYfY
	3z0IFFmSr8Q5z91DTiZsHbZJTo0dSk4S9+2YJDxNaHAJALPPC8GAKFUB4fegAzTRR5w1DATcnkEbc
	f9m9NzwnYA9JLHvP6oQN8Ap1eSy2cmgrr/fiR5C2lq1kRwm+iIrlN0hhVFKUAGYmE0VxvybYseGsW
	Wb7YfHlp1VGQd6Sf0xL+LnyGNbe19OaRGp+gJZelAeaoW0OgmBRhucAKtF/CkMyBPdc5obDhrH1xV
	tbAfMtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxb2-00000005nSp-1Ed4;
	Tue, 09 Jun 2026 14:38:28 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxay-00000005nRn-41mH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:38:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id A8C7E1D00108;
	Tue,  9 Jun 2026 10:38:23 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 10:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781015903;
	 x=1781102303; bh=OQpu1OhWPmLhgQCfoB8dpZ9HJ92662GsLDeWYFfZD/c=; b=
	FlfGOwzGAo4KLfS3a9UDfQgvgvsMVtAWe0VHKf2094vgfx28DwmI5w/JMa379O/1
	b5ToDqNjmSSbVTkRsi+gdt3s8X7rDZcO225BW/cJ6ZHQW/PLPdWEmMPWC1D3no15
	xRhNXiyB1oDimx0vvBibUEO84xd++meXtt1ZdlFVSJ+JhlqOWY5oEyNmBDKMRPzQ
	ka9YgZHvpibjkA3Ym6I8BtP8/HYdnPfkr4SAzl9c6KI3DHFlv+Y0fT/oTnNcs8FX
	XJIt7WrbcuMRU0f5MC169vpDFcR5aENaos9ZFw2FOWYC+JmhW9mcOVX4VKMLZ38S
	gMzdBSxgKvZy1cP30+B6oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781015903; x=
	1781102303; bh=OQpu1OhWPmLhgQCfoB8dpZ9HJ92662GsLDeWYFfZD/c=; b=Z
	uSsEXRihfmEOUbNXyyzlD9lGf8bwbihB+p+m7QZwQ2pRIZ5wmdChrOzp7MeK1HZm
	hTDwT4eWV0cIT3Nkgb9iJU8EuMMaHD1ltY9tM+NzEF6cRfF/JpuCiowi9u/UQnLx
	rEpJa+LhD9nacbkpQYAHeVRiig8Q8eU2lMuQadafP57pGML5R6pOMsMt2PtA17KL
	Fi9952rSYFVgcB1LpZb9JPUEU5HCooucwTCulTBvKfuXUyqeMf+7W7GSNTC2QLvq
	9PHLmncpg7rgM/g8XSrh07jxLNA2BFrPi7ThNxIrPXdPoGGQcLJcpzp2J6bcdCvX
	9rbTzvGq18jPdwrXcKPwA==
X-ME-Sender: <xms:XyUoak86mUy0BYaOQlug-VUWM2yVQGXhrWFnMQ2UY8SF802vP2G_Ww>
    <xme:XyUoanihA2ZaAwd_4eRMoS_aHd5iGseMc2rQCcsBhYA6jYD5N0c6kVhUZYogom3mo
    _LuNr5uwkEWV-mHNRp4uNmaKuKvOY0mqRvYFPsM1gMVJDQ0cFBtE-4>
X-ME-Proxy-Cause: dmFkZTFYUZGOq/AvS7Q2hJPmVjv314Ck0BIhy23s9lgogZcHS1ANaQJSO05P+xI2m+WrIR
    lS0w8oye2jIfpymb+Xyu+duM38FHTA0w5MO9K0uFSW6i6r5TZZv2HW1r8H4iPH2gwKajXd
    ybcger4XpWtJzJzXPOUGlxTOi3xmHRqzWMDhXj7CprbXoftoBaiyX62VReqrV6f/ukiGXl
    DuYkbc+aL1lS+ysovuDQNGVYjo1eWZTrmxXji5PPnyWIU8Be+oNKrKOyWPmnJ0wBAsSleZ
    twTroz8W1RaQWvJwrpO+6fAiuH+t6Q8kwt8EeEHS+/1laRcNeAX4QsUMcejITyWOgWXFnS
    F8X1iBZd8rz58KC8Y6q4D8PCPd+l2LaQaaFitxkUTkzfTRttzlQ+jy0XGpG/4zReZ6hDDk
    mMccy5K1kaqGdLfKVYcImaF1Wu91WfsjgMjfOO/MmXqW2dzO+PR7K+7tIiRqI+3/FE7ga/
    8qOSXitySgUQZ2JqsLqOI11K31Jx/PxFuHJ9YBPrxM6YnqQhvKMIrsbvl4cpcADleQ/UHJ
    9yEPxDezdFtmTHlKmlM+7pEsbGAB80EiZ06iTYzTVYquJ6R3H8GX5HCHMVUwUJdD04c+a2
    AFZ+P9oZOW8dC0jkOWmWjCU9AxH+CodVXJh5n90lTRlDnjjQPoseKq2auwYg
X-ME-Proxy: <xmx:XyUoaulhNvs6XOCpyY-0yWjPT6_IGL-Akc6hKsWC54nUxBoPyFw4Qw>
    <xmx:XyUoav5lOHVcwXLMM32Ol2K4KaZ_X29CE1guqtgQ1QXUDn86bBje0Q>
    <xmx:XyUoasj8p1IgzrX2TxbttAVsYUtkxyQWG5xe798aoy72z1fAqLTNlw>
    <xmx:XyUoakFMayXJxA1LLaVEZDFlW5YqAzN2CO54YHxVBeNogLqk7cw7rw>
    <xmx:XyUoaiiR3g_UTWdn5fFxY7otM63eK8dJgglpMd__i7KDr_Mi4GX2YT4a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3BED41820082; Tue,  9 Jun 2026 10:38:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AJX4MtyQJOMN
Date: Tue, 09 Jun 2026 16:38:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thierry Reding" <thierry.reding@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Sasha Levin" <sashal@kernel.org>
Message-Id: <7c575b6d-5543-42e8-9b7c-be1e7148c454@app.fastmail.com>
In-Reply-To: <20260531060825.1855391-4-thierry.reding@kernel.org>
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
 <20260531060825.1855391-4-thierry.reding@kernel.org>
Subject: Re: [GIT PULL 4/6] firmware: tegra: Changes for v7.2-rc1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073825_279588_A6DA29D6 
X-CRM114-Status: UNSURE (   8.84  )
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

On Sun, May 31, 2026, at 08:08, Thierry Reding wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> ----------------------------------------------------------------
> Jon Hunter (2):
>       firmware: tegra: bpmp: Propagate debugfs errors
>       firmware: tegra: bpmp: Add support for multi-socket platforms
>
> Sasha Levin (1):
>       firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol

I'm merging this, but I would like to point out that the third
patch does not actually solve a real problem and the patch
description is complete nonsense.

Looking through linux-next, I see two more of Sasha's patches
addressing kconfiglint 'K002' warnings. I have not used that
tool and the warning sounds useful in general, but all three
of these patches look like false positives.

Sasha, please try to understand better what the tool is
trying to warn about.

      Arnd


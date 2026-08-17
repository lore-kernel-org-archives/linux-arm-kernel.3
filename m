Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18905C5DF7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhQKIZ+H8few0+TK0/wNTVTWNopXKBqleCxNSBB+9sc=; b=AWWY84roJdqzzqvddfh+EeJx1O
	LY9WxLmid7Nb4s2z1W7SURHiVW8GaoVN4ZWq0ILr9LFnfLwvMIsb11np+BK7Kk2pNjjiVEbfl8Ksb
	C3/jiphcRMXCfS09Lghg4oLh+itLBKNlEY1Qo8ZrtaUkwgObKiR6sbOxDqxQoL5frQUTgrN3i0h3m
	/RrXo3212wR/SXdhUlwfbQ+dtUIhjkZ9wZPeZ6GE6O+fpHbgSrYN+6J7g2axU4uz1rtSX1sb3x18F
	xnUKjIO3S6hszhLyWvuKPRB8uvjQps1EqELtfZUw7nwU1DORCWbzh/RFWXoco/ca8w65/wl5//q12
	0xNNi9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxfj-00000006EtP-2JNk;
	Mon, 17 Aug 2026 13:46:39 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxfh-00000006Esw-136M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786974394; x=1787233594;
	bh=dhQKIZ+H8few0+TK0/wNTVTWNopXKBqleCxNSBB+9sc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=zPBEohj69XfdFScDD4KzdUMn1gIE5UzKzoqVxw8Q7RVeQF3G/KwhhPOtjPvlGmzgv
	 VLdpqjTWqctBwG6eJAVgKXp5jCma+QomA/UxzcS1vWMmLegDIU42npALzaEiHv3F06
	 R/OY9idad/n642d+tn5FlHCeegduIc+s80SR0xcsW9rsv94UEyTguh8wZHGz4pyeRD
	 TQgG+cX3RlCWlAld8a/Bl+jrnpjK4nOa2hW401fB3YdqgU/7dwLpXyhakgy/84ftyx
	 WptZbSgcEDOVDaCk6U1K7MaIZ63xBQW07vdLieLYgjUTnCoViDI4ceibdqzjuOe74x
	 c2/fERwMWfqVQ==
Date: Mon, 17 Aug 2026 13:46:10 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
Subject: Re: [PATCH 0/2] Hi there,
Message-ID: <SPrg6EUkZ-PCiypsZLk9LApr47E57LZWtI7X7sb9gutvVZNN8OoPLGPDddUpntWMxqmj3gwaxMLB0-laSpWjUouqThibUbg65waiKOc3aF8=@protonmail.com>
In-Reply-To: <9e0c8579-fc12-403b-8df5-9cfe0a779fd2@kernel.org>
References: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org> <9e0c8579-fc12-403b-8df5-9cfe0a779fd2@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 74031ad895b61a08c1d1512d8e87aac5c2b45b7f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_064637_452363_D9BFEC5B 
X-CRM114-Status: UNSURE (   8.26  )
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

> > This patchset adds initial support for the Exynos 5515 SoC, along with

> You already sent a thread called "Hi there,". One is enough. Please name
> cover letters correctly, so it won't get messed in our mailboxes.

Sorry about that. First time using b4 and a mailing list for patch
submissions, and I failed to notice the missing subject.
Will fix in v2 as I have issues Sashiko picked up to fix anyways.

> Best regards,
> Krzysztof

Kind regards,
- Aiden Isik



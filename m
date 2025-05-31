Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10391C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 13:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xozu68n2U4XkV89Q8QXx5h2TgN5+OSHcITazRgmqzzs=; b=MlZBTtBGk2h4/Pwxh0glYL08xu
	clWuQHOGVeO+RUvdb1AyMyuiGH9Hvr3X4EvEIVEeN0mHIPmCrJ5/8kgC9q9wMSyHww1F4OxEHaMFJ
	j85lsWx40D+eZxsepgyOM5wOP7Hmi4oWAwjXbVoTgKUAaE0We4v4r1MPkn4StGNqGkCn6MLvADLtU
	Q/Qs18eF1IA4n0L8WSaKrq8A7pYUFShA8UeO4xfi+QsvTuYTCp3fhqfyvMZS0+3dvZmS40BvLbAa/
	1zmhMZjJiPkodeQvjv0IBWCT6G+jdrfxIQKcPrkFnwdJrL8nryHsuo0iYeT8AaVBaR7Mq9vAej1uS
	/KRHfdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLMTm-00000003pN7-1YzP;
	Sat, 31 May 2025 13:42:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLMRd-00000003p12-1IEy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 13:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31E1743885;
	Sat, 31 May 2025 13:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0886C4CEE3;
	Sat, 31 May 2025 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748698814;
	bh=XqWPDWiRyz4buOXC7JUMJhnKN++3un3+UjTzL+RenBA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=tOA7fp1qHt40RpiZGeKAKx1tLrPTsroFaTIV25L001kqllbEbTArnrZdiI1eHl/Zs
	 YnMESXwMzlvRCp3jEBoypdBP371/9osSa/CeAiCEDaRgz6W+oxfjWe1IflUTrFH1yj
	 7ASwYpKIgkyMJMkUfszVTlSoXs61DQbHzQ4FyBUgWrBCy+K1s50VYjEFZ5P1NO9DSi
	 HlIK5Mz2w+UYQVgTQMzYKsHYTbm38S1e2wlQvorSmEeuwN9COeRG3euRYKPssVCqCg
	 e3WH55EzKOXf+m70hoEjD8H0qtaWxgr67xKcbvHpj5FdjmYP1zI7plW9CIRBr+dz/T
	 abH3O3CrljJmg==
Date: Sat, 31 May 2025 06:40:09 -0700
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>
CC: linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-kbuild@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [GIT PULL] require gcc-8 and binutils-2.30
User-Agent: K-9 Mail for Android
In-Reply-To: <feab370a-3857-4ae9-a22d-1ab6d992c73c@app.fastmail.com>
References: <feab370a-3857-4ae9-a22d-1ab6d992c73c@app.fastmail.com>
Message-ID: <D46A2AE5-F7F8-482F-8D26-C7179D8115CE@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_064017_358237_C918E513 
X-CRM114-Status: UNSURE (   5.78  )
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



On May 31, 2025 2:09:53 AM PDT, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>      Kbuild: remove structleak gcc plugin
>      gcc-plugins: remove SANCOV gcc plugin

I didn't see either of these emailed out, but we'd talked about it earlier=
 and the resulting changes look good to me=2E Thanks!=20

Acked-by: Kees Cook<kees@kernel=2Eorg>

--=20
Kees Cook


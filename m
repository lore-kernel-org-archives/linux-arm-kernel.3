Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB74CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThhBRcX6/p7YU2+RvkWgHEHY2TRLm9lTL6Ph40Aa+5I=; b=paOHzB9UCqlnYuSRO9l66s01Ho
	h4oHkgMK2IXHTKmbZc4P4BJteNY6mHzrAIuQyY8r15r2uv969oaqXLJiu+xlesjkod+EWwPul6M7A
	eRRpburgKHVc1mYmb5TGbJbSySvPzb2Q4fcJMek/8Y1BBDqauVpnVuEU/YsCZkTqqI/VsBXZKjHVq
	MJD4mzgOTSAglWO5uoodtj5dARLL9batVm2R3mdq20h3tL/p2md0DzZsRRS3R0pLIZNLcHvwegEJd
	0fMvThEgwSOTRydbiB8UTMXmrVaI4jo8wWZM9Gc8e/uxkGXGw/CV6FvocLj+WOPIa0ax5aYUsFfiN
	bz8O/zRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqB0w-00000006CMc-37jL;
	Sun, 24 Aug 2025 13:44:06 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqAyK-00000006CGi-27bX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 13:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756042847; x=1756647647; i=markus.elfring@web.de;
	bh=ThhBRcX6/p7YU2+RvkWgHEHY2TRLm9lTL6Ph40Aa+5I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jxEzXeTBP+68tE5wfTClMvw1oyIuZbM+QlQeQfZ3kDvDfClrLBKO/L/RazfnwPGD
	 Kf/bxdHL5IqOdQx88GjoDxqtukLZmc11JqI/+jgN3hVnTyuDc7q+LZyJYAunVlqPR
	 plI5My6+GwSOAoMnrDDJZp4gTbQQwSPlE1hjaBnGRjKA2qAFjWv054GN9BNB1EvQd
	 Ay9ZEn03J1yooJ3F9iGSPiWQOLXDx8KBmP0ehwB/jcfJjMlI7OUsJ/U54P6CUJeLU
	 QzIPN7IMQ+VQFbyPqSZPYAvbnO59GL55sogglRZHjQrR5JaItxTsaVpqMtfJn+RV9
	 xsUhYyfgXbWQ+gYXOQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.216]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MbCI8-1uEvOo3WwK-00bL4D; Sun, 24
 Aug 2025 15:40:46 +0200
Message-ID: <ed07c6f9-e389-4387-8585-6f1206da1a07@web.de>
Date: Sun, 24 Aug 2025 15:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>,
 linux-kselftest@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Eric Biggers
 <ebiggers@google.com>, Mark Brown <broonie@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shuah Khan <shuah@kernel.org>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
 Will Deacon <will@kernel.org>
References: <20250824131647.490439-1-zlatistiv@gmail.com>
Subject: Re: [PATCH] selftests/arm64: Fix typos in malloc return value check
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250824131647.490439-1-zlatistiv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/T3t3ZAVHga2cRT8inLG1YjTPE//C9T8JhWWXadlIlzIjk0iPib
 KyUV02mmjAwRjh45d9Dz39ay9YRQjEqwZHmZpgUY7FTvSDEeaO2KVIyaGhwDoaxnXq03/L5
 y5p6w+NIb5pNNCsQrz8cp9f4BDgn4mfDujlfMR2kbkrp3qn61yeGpW1X5zXODY26onAxstz
 RtrdtFrXWHSuc/EwhIy2A==
UI-OutboundReport: notjunk:1;M01:P0:60wxeolHwes=;X/f3rpYEiMysYa5Wtf0smBdZYMD 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 z57ebfHmrfvHi8qSWfENkT9vRryS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_064124_833562_EBCEF6D6 
X-CRM114-Status: UNSURE (   4.14  )
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

> Fix double "-ed" in malloc return value check

Refine wordings in error message string literals?

Regards,
Markus


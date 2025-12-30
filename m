Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22210E9410A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7MuhpFuhJOuB1ZkxXNKbETWpshIvQ50dTBnFcWSOFE=; b=pnoz2MIixwdJcga9FhtOqcsqX7
	ZVfgwKSQBOMuMmjlZ7dccZ77/v4bgQpmVDTVXVYDSuMYy/hMani1N2xmrvdRBTVbSgnUHRw8DCDXR
	4ppl5uAqdqWDUii39dS8i5lZOPqTmwZLbT484F9YzIFCqyy8FVPtTFofv9i2lCGVW762Hwe5BdtRB
	NRDuU0YfUyt2RAiFbi26URVNGOVEHt1y3NXSJG5b61nrlBWjsQnw+0rO28fJInlxonsN/Ix3VZuXX
	u1lN87i1hi/rZAMv5UqD4QL501eD7eU71iPJrPOU7goFOKRc8iZZKNtei5sw+MMQ1eQpYt5ivSA6H
	ca/rhbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPNl-00000004Iev-45Zb;
	Tue, 30 Dec 2025 02:22:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPNj-00000004Iea-0mGL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:22:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55E12403F0;
	Tue, 30 Dec 2025 02:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C03C4CEF7;
	Tue, 30 Dec 2025 02:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061362;
	bh=/psuR/3hwPcJXh/QxQDIWHYcRBOf2JQDF0tA2oZ5EE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAkkOMjtE/NFwqwLKKAWdE4xg1Nr453fHrv9QVVH43Hg5+P3MubD75i3BHxBcSSZX
	 foTwDCvNTSAAB9tLotyetesFJWYUIhfxy44jZxEV3EFR7cbCr9GBluN7WzUpWTSuKa
	 CIrAiqGq6c4JPcTFQOssiyfDelYfsv/O7b8EsSxJwZP5csbmWGb05DDkOFBW118XlQ
	 gPvfZfHAG7DhoGBBuoD4+XsWrZJt3F0iEP4Tmf4I3pVDMo6M6RXAW+Mo+CNKidWHh+
	 iAwD9Qfsqp8L6OcJsTbop8CxB3j4XTgrBjP9N96E4JsZRuR2LakMa4SjYdJtc8tzWO
	 sP13ghCLyxpmQ==
Date: Mon, 29 Dec 2025 20:22:41 -0600
From: Rob Herring <robh@kernel.org>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dt-bindings: hwmon: aspeed-pwm-tacho: fix typos
Message-ID: <20251230022241.GA3214066-robh@kernel.org>
References: <20251224083845.2727976-1-weibu@redadmin.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224083845.2727976-1-weibu@redadmin.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_182243_244550_1D57ECA0 
X-CRM114-Status: UNSURE (   8.64  )
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

On Wed, Dec 24, 2025 at 05:38:45PM +0900, Akiyoshi Kurita wrote:
> Fix "upto" -> "up to" occurrences and add missing "be" in one sentence.

This is in the process of being converted to schema. Please review that 
patch and check these issues are not copied over.

In general, don't fix .txt bindings. Convert to schema if you want to 
improve them.

Rob



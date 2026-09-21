Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630AAC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgN/lyBHIQHvRhtppqh155Aa60jOq7iCmkBRB/vm9B4=; b=Uo2fe4OX55aPxDxG5gud2U6EQV
	aZ7ZZQKQqD+BqcRfCdapDfW+PV1yGcIV3QPifbTeruIiF8QuS9Lt+gBcuTFPRntAoqfDcSqZjdMQS
	TmQmvDzSsb2Rh0EBRODUi4WY69yRqlLBm+HM0UBrms5Rqv9jrqK5hm2rC/qBDFew7CpjotIGQvRBr
	P+lRe83eYQ+tTVN1cpITQezKBrYunjTX2Hf1HJZDBcGBinNGIJNz8OHkq+5BIn2Kyun8o20g7B201
	5yD6NHEH+tE9zsnp4lyaIwRQzf/O8JNVDv8IhA7ld/kz6CUB8uAWJQkK3a+Ba71wmjtPTq6RSGPun
	tkfe81jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ytq-00000001Hc4-1eOe;
	Mon, 21 Sep 2026 07:57:18 +0000
Received: from sphereful.davidgow.net ([203.29.242.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ytk-00000001Ha6-32gC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:57:17 +0000
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 668B31EAC40; Mon, 21 Sep 2026 15:56:56 +0800 (AWST)
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 1B67F1EAC30;
	Mon, 21 Sep 2026 15:56:54 +0800 (AWST)
Message-ID: <daa639e5-a5d8-47c5-9739-69d721052366@davidgow.net>
Date: Mon, 21 Sep 2026 15:56:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: microchip: vcap: Stop selecting DEBUG_FS for
 KUnit tests
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <20260917064736.77354-1-kmehltretter@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260917064736.77354-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_005712_954328_52563258 
X-CRM114-Status: GOOD (  10.29  )
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

Le 17/09/2026 à 14:47, Karl Mehltretter a écrit :
> VCAP_KUNIT_TEST enables DEBUG_FS even when the kernel configuration
> leaves it disabled. Remove the selection, following the dependency rule
> in Documentation/dev-tools/kunit/style.rst.
> 
> The debugfs implementation and its tests are already built only with
> DEBUG_FS. The other VCAP tests can run without it.
> 
> Fixes: 552b7d131aa0 ("net: microchip: sparx5: Add VCAP debugfs KUNIT test")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Validation on net c9151088f167: x86_64 LLVM builds and QEMU runs
> with DEBUG_FS disabled and enabled. The other VCAP suites pass in both
> configurations. The debugfs suite is present only with DEBUG_FS=y and
> all four cases pass.
> 

Acked-by: David Gow <david@davidgow.net>

Cheers,
-- David




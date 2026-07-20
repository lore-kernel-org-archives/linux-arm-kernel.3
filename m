Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA02C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmzypLZEgjSe46HXGqJPfMs35yMOcv/5WZuNvyVYTfU=; b=oO3Nu0DDAZKHgzo/M6gN/ryCwZ
	RXfHz4jh5ihUdcZy0bZA6Rftk6gnDCJnygpUL6QpzokufZAtTh7d1Q3Z+7manQbv/t+eJYg+c+YqC
	eLSbYXS5HGuQ26GmRWKuwIfOriM/Wl+u66uOXKPk49L1Zijz5GciDYgBcq9Xf/QDHmd6oSakEEklC
	YsPXjEZz/rZFGZyNWJAGAHP6J+NeGCOjfzcqsiRQqXrVVzoYeZ6JhT5P7Luo/pAc9sl79GqRpdOHr
	oeAuKZ6GqLp5m9WPLUXiVoD3wbkuJaL/u+QhD/jJhZ56JGqRdktD9p8fEoUbjqGQNiPWh0q757Qug
	gfCDt1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnm8-00000006lXV-2Iya;
	Mon, 20 Jul 2026 13:11:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnm5-00000006lWg-2vRJ;
	Mon, 20 Jul 2026 13:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784553070;
	bh=9KyVBD8Wk5cUPrXz3Wk18pJ4qJEyElw/o8p4FCDFnx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JJ8cOPvrzp2Uoh7WBuKlVDJBLMCESDfmTRE6efMLydtMO4Rb8knKVQBA3wGk7NujV
	 aLI5yU6wehgjLX+hYGB6SGWPuqIK5hLWma1g8AXCToUJwvKCGnJ1x0omgTt4sNyStz
	 mSBgbIfkgBLF4KqSVQACXYpYqVon09iqRpcUr6e5fiyjkQmIFOiC2rOs8HRwAXwR0R
	 Rxzhsi+jiFtGoS+osbrEjNHXES9WvHF1b9qw54gc3K+L+VNsdUVG2Wqibk75xE3IGo
	 avAtKJmCEztGMcQrLv9PKUNCTgjQ4b18Jr7M/p2grmILTKPxsrXjlPLjAjMdWbWVzO
	 2R4EXf/jRTUIA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2ED9517E0D87;
	Mon, 20 Jul 2026 15:11:10 +0200 (CEST)
Message-ID: <486a32c0-d940-47f9-8675-4e10a87ce38a@collabora.com>
Date: Mon, 20 Jul 2026 15:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: reset: Add MT6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260717163959.714561-1-l.scorcia@gmail.com>
 <20260717163959.714561-2-l.scorcia@gmail.com>
 <20260720-gabby-strategic-goose-b61c4e@quoll>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260720-gabby-strategic-goose-b61c4e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_061113_885907_6A89FE58 
X-CRM114-Status: GOOD (  17.33  )
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

On 7/20/26 08:25, Krzysztof Kozlowski wrote:
> On Fri, Jul 17, 2026 at 06:39:12PM +0200, Luca Leonardo Scorcia wrote:
>> Add reset constants for the 12 MT6589 toprgu resets.
> 
> 
> This is not a single-patch patchset. Seven patches.
> 
> So one posting per 24h, so we actually have a possibility to review it.
> 

krzk, that's because Sashiko provides reviews instantly, and people just go and
fix things to make it easier on us maintainers to provide reviews (and avoiding
to see the same Sashiko complaints from us).

That said, this gets into personal preference territory, and I'm not trying to
start any conversation about that specifically...

>>
>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>> ---
>>   .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>   create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
>>
>> diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
>> new file mode 100644
>> index 000000000000..ee08c39df513
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h
> 
> 
> Why is this header being added outside of patch documenting compatible?
> You have entire commit msg to say something useful instead of repeating
> the subject.

Because he wrote it all in the cover letter... which is something that gets
read right now, but gets lost once the commits are picked - so all context and
explaining are completely lost.

Luca, that's why krzk is complaining :-)

Just write the information in each commit's description, so that it doesn't get
lost, and so that the next one trying to understand what went on with the toprgu
can just read it there. :-)

Cheers,
Angelo


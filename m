Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2717D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfI3MnTJh+nT7GJWU9+AcXGbs8fOZDGinjVpGzueX0s=; b=FKsNJSZkvGvPDXQXX2kws6RqwY
	qcQoNgs6Tno0gkgxLmcjKCqW8J8Aal4AUps9MC3IU7cagKiv6CWiHXhRJGPOy+4iNSXerf9OvamdB
	ZeUCToeNTGSVrLbsB5QjwjE1lPXZ1HLn8CJ92oXiDQ/04X+y1EbASYv1deUiyI6DzMTp8DsC5xCHv
	8YSj7ndeqv4mXD8ZbUFsvWSH66YGm7iKz6C6CF6h9M2/mKHLpx2nb5LS+uYfEjohmfxIXdSx8tXQS
	ieAxH82xaqv2nSPv67tvkA4KqMACZNgPXUEfS3+maKtQr5U+TSxJd3TyWEM8xJEeph/+dlpVXTozC
	yyHKafKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWXc-0000000G8Vl-2Q1p;
	Thu, 27 Nov 2025 07:35:48 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWXZ-0000000G8SX-2qdj;
	Thu, 27 Nov 2025 07:35:47 +0000
X-QQ-mid: zesmtpip4t1764228896tea6b6582
X-QQ-Originating-IP: m2NFOC1l7CtxMECnINXb88RBau0mbZAl118Ji8E0/s0=
Received: from [IPV6:240f:10b:7440:1:c95a:801a ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Nov 2025 15:34:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4363788777336798568
Message-ID: <F11F0D13437B012D+0c15c5ca-f64f-49f1-9ff5-26b88d59ff59@radxa.com>
Date: Thu, 27 Nov 2025 16:34:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
From: FUKAUMI Naoki <naoki@radxa.com>
To: Niklas Cassel <cassel@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251111105100.869997-8-cassel@kernel.org>
 <mt7miqkipr4dvxemftq6octxqzauueln252ncrcwy6i2t7wfhi@jtwokeilhwsi>
 <aSRli_Mb6qoQ9TZO@ryzen>
 <7667E818D7D31A4E+cf7c83d4-b99c-469d-8d46-588fc95b843f@radxa.com>
Content-Language: en-US
In-Reply-To: <7667E818D7D31A4E+cf7c83d4-b99c-469d-8d46-588fc95b843f@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M8eXz3YJtIUHVeCj2S4KR1MZmmoX2rpgqITCRKAByPTmRvDFqhCMxd9n
	fNsp4rjiFxs2pmH9ymwz9fBj11QjGjwfkT4el0ZZ6vPUpiCbAr01EBvtAXghxjxOFGdpRZ1
	BhqzamevYG3sA7sEeeouEtU4Sd7zeFRC2Ftta9hZsJGZFVhQ1srNKcdfBWuGSjI7HZBTJOt
	CgvQe6zMaeKvp+OryiLX9bZGLwMxvBFMkK5qwfxbjIumDlBDiKovdhnBXKO4UOHOhoeTqdY
	p6RhrWqh3wP/y1Pai/k1HvqkFQJ+dEIkLqHluT7b5WbxxWdLJHDkI2Wtek/J9KKqOoVeLm+
	/E+ujymEQlD1ZG0xqYV05z4sRcCOAS98kn1VDeJsnNZVeOXCUi1hwGefH67EZgo1rqXLE5k
	OqtKbSD8Laz77TYqD0ZCTBryrLVFqdmWQzX3iMqudOGszbKQZhK9atNQ97rrwdS9xxshz5K
	/fanU15gi5cK+cgvb52kr28bPEl3jsCz7/Ex6hQT7i+kvYQuWc4fNwEPQUvTEZt7ozHHFni
	LCvEJuYnIJkjb+8gaRJQd4lZYqPkUJUeoR2qZeW3McbpKU7TBd/qXJ9lIt7LaVHiu6LX/XJ
	3Gv057ENBY2itXgM2mXhv5sGXkfjrxJLVf+00/ZkjZlK2CJ9OKB+JeBYL2c8mACk0LvS0K2
	L4qyzB6lJkVNZB94iyqIYwEvjCNjIjuAKv6UKtFHFnqWFaigyFCe4COxiyJhIz1/E47DS7j
	p5nIa3RdtHGsfwASEfXYUsNxIBrWm23LScRCGyHKyiFRDlaLC3nCn6KCc+cJvcmJ8pKkhjS
	rrASjkG12MZa/2ZLfMnDJAFvLPa3uuHBP38VS+3036P66v5mVPUev2WHSoYTIAwrT1tm4+B
	9VCvJK23m7GzZDdO29ss+Y9f47W/o5cLMvy66PrnGufFpt6vVbFt73K2+LCTYkG1dwzXY6v
	jh/O6bmqMTDgOiHzNiHIQ/Qpm78kIjvKhyGtjtCA5iE8/0Jh9uAJ3YjBfzFGA7g1AwqhO+Z
	ancZMogA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_233546_207028_42631DDF 
X-CRM114-Status: GOOD (  24.65  )
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

Hi all,

I'm very sorry, but my ROCK 5C appears to be unreliable. (It worked fine 
with vanilla v6.13, so I thought it was fine.)

I replaced it with another 5C (Lite), and now every method (Niklas's 
patch, Shawn's patch, and applying patch 1 and 2) seems to work.

Testing with the 5C Lite is still not enough, further testing is 
required, but I will probably need to revise my test results.

(Those seem to work on ROCK 5A/5B, but they also need further testing.)

I truly apologize for my unreliable testing.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

On 11/26/25 22:30, FUKAUMI Naoki wrote:
> Hi Niklas,
> 
> I apologize for the delayed response.
> 
> On 11/24/25 23:02, Niklas Cassel wrote:
>> On Mon, Nov 24, 2025 at 06:07:44PM +0530, Manivannan Sadhasivam wrote:
>>> While I suggested to revert the link up IRQ patch for rockchip 
>>> earlier, I didn't
>>> expect to drop the support for Qcom. The reason is, on Qcom SoCs, we 
>>> have not
>>> seen a case where people connect a random PCIe switch and saw 
>>> failures. Most of
>>> the Qcom usecases were around the M.2 and other proprietary 
>>> connectors. There is
>>> only one in-house PCIe switch that is being actively used in our 
>>> products, but
>>> so far, none of the bootloaders have turned them ON before kernel 
>>> booting. So
>>> kernel relies on the newly merged pwrctrl driver to do the job. Even 
>>> though it
>>> also suffers from the same resource allocation issue, this series 
>>> won't help in
>>> any way as pwrctrl core performs rescan after the switch power ON, 
>>> and by that
>>> time, it will be very late anyway.
>>>
>>> So I'm happy to take the rockhip patches from this series as they fix 
>>> the real
>>> issue that people have reported. But once the pwrctrl rework series 
>>> gets merged,
>>> and the rockchip drivers support them, we can bring back the reverted 
>>> changes.
>>
>> FUKAUMI Naoki, just to confirm:
>>
>> Neither my suggested approach:
>> https://lore.kernel.org/linux-pci/aRHdeVCY3rRmxe80@ryzen/
>>
>> nor Shawn's suggested approach:
>> https://lore.kernel.org/linux-pci/dc932773-af5b-4af7- 
>> a0d0-8cc72dfbd3c7@rock-chips.com/
>>
>> worked for you?
> 
> Yes, I re-tested the two methods mentioned above, separately, on v6.18- 
> rc7, but neither of them resolved the issue in my environment (ROCK 5C + 
> ASM2806).
> 
>> If so, I don't see many alternative but for Mani to apply patch 1 and
>> patch 2 from this series.
> 
> I believe applying patch 1 and patch 2 should be sufficient.
> 
> ----
> 
> Incidentally, (probably) while applying patch 1 and patch 2, I have 
> encountered the following issue several times:
> 
> [    1.709614] pcieport 0004:41:00.0: of_irq_parse_pci: failed with rc=134
> [    1.710208] pcieport 0004:41:00.0: Unable to change power state from 
> D3cold to D0, device inaccessible
> 
> I am still investigating this matter, and the conditions under which it 
> occurs are currently unknown.
> 
> Best regards,
> 
> -- 
> FUKAUMI Naoki
> Radxa Computer (Shenzhen) Co., Ltd.
> 
>> Kind regards,
>> Niklas
>>
> 



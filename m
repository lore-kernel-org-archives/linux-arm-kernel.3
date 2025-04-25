Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F144C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zG66mfWXbPjwAhDXIOR7A3831eYYgiM5AtcB2S18NL4=; b=H7uFBWNI5c3vx6cMMGy9jiPIsJ
	S4Jkh86D0wq8hp30gR6SpGBw2/t+lanKb8kE7IZo0h1wDbbX2Er7B3bV7kZeoFUizzf6xf3GWmUi5
	4slhdamF2DsG9VrJQwGtrwq8BdzzwxGnKQMchzvSn38/VBnAp9MIl4Us9qFrYUnofv24AawLSoIvk
	Fd1PgBMlbG2K8aYZhZa5q0IufG4kr3CYZeNF7UDvsqtCUs7CdHhMGA7pL3xbbq4gualsimfRrMMhh
	FCaN1KZ1rwqi0n8xNGUJnCaYcb2ui1qA9kUaCg8853VOK3rfskJ6jxujKTCmgexX7xEM2+0oBB/Ql
	2gzEmlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HxF-0000000H5Jb-08jH;
	Fri, 25 Apr 2025 12:14:53 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GHU-0000000GjQC-0HMo;
	Fri, 25 Apr 2025 10:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=zG66mfWXbPjwAhDXIOR7A3831eYYgiM5AtcB2S18NL4=;
	b=X5PsQabrR9K6jEK20m5Eq2MEBQh2A09QM7jIB2UrPHQt0hNJboxBD2siXKisad
	1paXffNBE7hxQ+f8HzCeu9z8lHGHyut6+CtFCe/FOO0gCvcrs27FH7TQU67pm2Mk
	78D9AMShMMXJO++3C+VZRrCWdrbh4XpmD9TXmYvFl9DZg=
Received: from [192.168.142.52] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAH4ilJYwto+c_QBg--.57013S2;
	Fri, 25 Apr 2025 18:26:18 +0800 (CST)
Message-ID: <7c7d5e12-7378-473e-941a-33c1b03cc8c9@163.com>
Date: Fri, 25 Apr 2025 18:26:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] PCI: Remove redundant MPS configuration
To: Niklas Cassel <cassel@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, thomas.petazzoni@bootlin.com,
 manivannan.sadhasivam@linaro.org, yue.wang@amlogic.com, pali@kernel.org,
 neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250425095708.32662-1-18255117159@163.com>
 <20250425095708.32662-3-18255117159@163.com> <aAthR8ZXSqfe6fzV@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aAthR8ZXSqfe6fzV@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PSgvCgAH4ilJYwto+c_QBg--.57013S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xw1Dtry8AFWxKr18AFyxZrb_yoW8Jr1Upa
	ySvrySya18tr4F9anrA3W8CryrWas7Kr90qr98Gr1xJ3Z0vF13JFya9F10q34UJryYq3W0
	yF4Yv347C3Z0kFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UM89_UUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOho6o2gLYUIC+QACsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_032740_923777_65FA2C57 
X-CRM114-Status: GOOD (  11.18  )
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



On 2025/4/25 18:17, Niklas Cassel wrote:
> On Fri, Apr 25, 2025 at 05:57:08PM +0800, Hans Zhang wrote:
>> With the PCI core now centrally configuring root port MPS to
>> hardware-supported maximums (via 128 << pcie_mpss) during host probing,
>> platform-specific MPS adjustments are redundant. This patch removes the
>> custom the configuration of the max payload logic to align with the
>> standardized initialization flow.
>>
>> By eliminating redundant code, this change prevents conflicts with global
>> PCIe hierarchy tuning policies and reduces maintenance overhead. The Meson
>> driver now fully relies on the core PCI framework for MPS configuration,
>> ensuring consistency across the PCIe topology while preserving
>> hardware-specific MRRS handling.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
>>   drivers/pci/controller/pci-aardvark.c  |  2 --
> 
> Since you are touching two drivers (and the changes are not exactly identical),
> I suggest that you do one patch per driver.

Dear Niklas,

Thank you very much for your reply. In the next version, I will split 
two patches.

Best regards,
Hans





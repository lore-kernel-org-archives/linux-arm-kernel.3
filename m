Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799D9D30CFE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 01:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtDaMTrCVYTenPyLUxDxSKCKTU8w9pk7EHSNHOX9HKM=; b=2D1BBlbtWrDliSg73H7TvuaBZK
	p8K/QwFlL3RDS98ToNoHAHiDFleqRYc9vFYSNfoBFWC6aGJvXof7kEk4DVFm678SWuG2B2Hx8hajH
	RTkPIzSwREuyZQMeZsEi0B1GrT3unBeKVZowwRswBl36ETp01U+RB0JltFlumsAMJgeJ2wP/oBvmR
	2Rz2J2MO64bQhieC7nZJEkFS+ERAqMYbmYlEba6kGEYtnwAILlaTzZTOlkE1sfCv3n7IMJGLIm05R
	KTb4SvizwTl9XYtrXp2NfVzPxBTU+SofReoeSyKQO+uMek5xRplvz+b4GpWRJPOpdFrv0NreRo3oe
	odCX/VFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpvl-00000007xQQ-0PSo;
	Wed, 14 Jan 2026 01:44:17 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpvi-00000007xOk-3iiJ;
	Wed, 14 Jan 2026 01:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768354970;
	bh=JtDaMTrCVYTenPyLUxDxSKCKTU8w9pk7EHSNHOX9HKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cwGDN4CV1gVhbiig7lhSn9Wzhuy88NCCh/A+Jo5pEUFHUXNDaERE0br5EUoaX5N/e
	 SuxU/EJbjYzlu7YSvIWm8SoGsvrePUGD5Gil241qPp/1yHEOQ0SH2hIyza4E+t1IXf
	 qfNVbjHVbUBacSVElx3xg4NUbVh/mjyoVtd8xQcs=
X-QQ-mid: esmtpgz12t1768354962tdb7ab234
X-QQ-Originating-IP: C3zBYr1GJh9vpI3rU4BSSw305QsfwgZ2bJEwtEh/f9c=
Received: from [172.16.12.51] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 Jan 2026 09:42:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7794570359675995168
Message-ID: <C5D30204B8186D5B+5f2f87f2-3fff-403e-a439-847fda61e2d8@airkyi.com>
Date: Wed, 14 Jan 2026 09:42:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add DisplayPort support for rk3576
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Andy Yan <andyshrk@163.com>, heiko@sntech.de,
 dmitry.baryshkov@oss.qualcomm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 mripard@kernel.org, hjc@rock-chips.com, robh@kernel.org,
 tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
References: <20260109080054.228671-1-andyshrk@163.com>
 <aWa8mvBkTrKhZBFo@venus>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <aWa8mvBkTrKhZBFo@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OatzRg8pHEjp9nPMuOfAIDYiogTmRS1w5otD66gS7MphYXe6UQYMhFfe
	PvwbI57UVt/joEGMsR952ECncWatZRD4OdaWX5TZJBomWpHzEfqzKSburwN7u3HSZg0lyoV
	9AMNtcdBJUIzaE9Gt+Xl81Zcs4UlVjjmwVXcNuGkTr9VWQuBGEuo059Lf2ty8VKpgsLyE4I
	wufOnPyenTz6D7hW81M/25uT75zjoXn3E+1R/VK3iS8MdpgPszr7KvaPFhImPHNfK7bkj0M
	wNPTyNz8ZmAYji5O7/kj7vvGTBnSGjr7EpyqzgtuAZkQfa1eHGggcw9AIAyinZcjexl3TSM
	JitP7fgKXHW1dQQ67i7QXGOqbdhD4EnJdhulmt6TGeTZPFbani7HXJ/AqF2N2uWIbNqjXLs
	G4pp0jT9bwGWLRLjV1UQYz/PibOVgV2ZKf/IDwGrzp3NdmzW0i4RNP9akmx7QAXx6h7hVoL
	2Z8YYFAGDQKHwGudImNOdXsdqa0wKDqsOvROsbqgJIRLhelcPL+iGQeffcDNzJbZxBYr/Rb
	Um5LOnGnsF2/itseh3lQgebXnT3HzUVPNxf95x3cS3+Pb3+tHwPvzts5F7HySaFRfT724k4
	R1YO/MjXprSbwSuEM05XqDuU790RaRlcGXqcZSL5Wk9yyKzciXEc8ntoVAcR7qC59INtip/
	YX9JFHzSmC9lEKv9Td45InmAqTc+YFmVIoV9Su1yihGR/QL7MdHOhMcalSgr0AJEyMnG4G9
	fYMNDBbzyygsRBOU2ZclucB9hZJbUgRwFEaVGeDksTpCqpEi+dtDsWVBv6ecl/5u+l1A2ci
	g8d9Y06KYZEA7sBbFWuLZGmOkg3vGCGgsPDXSBYxUnliCO6f1NYYdD9Ho6gpnWINPdC4zuW
	nhJ9YiYV565NgskJpQhIaJR/z0oOTr50QKB91AHRAUPuoF/NhzELzqBVVfSeZjZqhlx2/kc
	7xNai/pEiC4+4xxVl341uNMmZxu+CqAW6X1WkEf+7FVKEZIk3ukznoqeH
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_174415_442750_269BE91B 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Sebastian,

On 1/14/2026 5:51 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Jan 09, 2026 at 04:00:43PM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> The DisplayPort found on RK3576 is very similar to that of RK3588,
>> but work in qual pixel mode and support for MST.
>>
>> This patch series aims to add basic display output, not include
>> audio and MST, which will be the work for the next stage.
>>
>> Only test with 2 lane standard DP port output now.
> 
> This is a nice minimal series :) I got it working to some degree on
> the RK3576 Sige5 USB-C port. The display connection detection is
> _very_ unstable, but that part is handled by the TypeC Port Manager
> and unrelated to the DP controller (and already an issue on the RK3588
> based Rock 5B). IF the display is detected (i.e. USB-C side worked
> properly), the DP controller managed to do proper output too. Thus
> I believe this should be merged. I plan to look into the TCPM issues
> in the meantime.

Based on experience with other platforms, I suspect that some HPD events
are not being properly propagated to the DP driver. This might be worth 
looking into.

-- 
Best, 
Chaoyi



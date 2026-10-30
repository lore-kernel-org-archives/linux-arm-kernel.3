Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAE3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 22:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lDNYsaO/;
	dkim=pass (2048-bit key, unprotected) header.d=manyhobbies.com header.i=@manyhobbies.com header.a=rsa-sha256 header.s=sig1 header.b=nqExYuXf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0gIgGhCHm8bEpsZOPji4A4j+l9vAgID+Kd1kyXON6Fw=; b=lDNYsaO/2aRHMO
	njRxeAkHtsU0IcSvSqEsC3SVCfSqOeRwVl8BDeoRfSMHYPs831L9JcQya5UQ/G2ZY0Y9lOqkL9EMY
	Ut4UkUwsclBRW8YVP9XYiHxM2J5ccNbqYMdbKzjmcWTVqHYILMXU2jWpKmTENogGTIJOTBvmnuuA9
	e7CiUxsg5kascjMvDNwNxW3A2LhIG96L9DTLbneAZiVF9cpvHlrHtj2DJShGsuGslc5Ucbot3gIN0
	9dtjFs9tazG4+Oqj/zkXBGA8bU27kc+vMj1jQvgFh2WWA6iNIk0kQTTnO4mI52IOKAx+hEpbKcCMm
	O944EEkTl09SQ7s/o7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvHa-0000000Cgdd-1Ob9;
	Fri, 30 Oct 2026 22:41:10 +0000
Received: from ci-2003g-snip6-5.eps.apple.com ([2a01:b747:3005:200::44] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvHX-0000000CgcT-1tb5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 22:41:09 +0000
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-0 (Postfix) with ESMTPS id 53F371800103;
	Fri, 30 Oct 2026 22:41:02 +0000 (UTC)
X-ICL-RepId: 01a18ef9-4138-705a-adf8-b80ccabb6893
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPAUMGWQZeD04dXwVcEhVdRUcMWkVWH3kVUgNOA10SWxFWHhkIXR0ZHldQWgpcCVEXUQ9eDkFeWhdeTUUID0kZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1UGV0UXwRQElAdQENUBF9QVBFXUAsocTYMO3AuBUYAMwA+HllyXnNdAU0GXRopCjMPTHApAC0GQA04XgxZElofWxpaCERFUR9URhMZThtXTVoNQBlYBm0UVhVSBFk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manyhobbies.com; s=sig1; t=1793400063; x=1824936063; bh=0gIgGhCHm8bEpsZOPji4A4j+l9vAgID+Kd1kyXON6Fw=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=nqExYuXfLJrPoynK9F6P4VbvZ2fGHT7sVifY/wFM5L+HySm/SV/o38zOUBRUc2tCZLb3qjWQ1RZGZg59yinmI7YPy+RpQDUK0r2702bNxy6ZBfiP9Irtgvqm/d/ICVJS5d8EQ+pPI/9aNxjABVPOkW8M5txl/qIn3Du8ePfLsJIBPhF7OCWivUi66pwqRIt5qbGBRaWdJ2PQgIr1Iha2yrfUSy4hezjY5VbwIoc/tqyKWi+NcjWvcSlXny6zkfjajKuqPxzi6RkXnIJ+dwlKxedxNNUnrdQkGnJXmBo6B0J2C17tIp3b/iUiRYDspY3ZcdBaTuCj6kaZqMEUybou8A==
mail-alias-created-date: 1780273699991
Received: from smtpclient.apple (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-0 (Postfix) with ESMTPSA id 54B7518000B3;
	Fri, 30 Oct 2026 22:41:01 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3] mmc: sunxi: reset the controller after an update-clock
 timeout
From: tam.do@manyhobbies.com
In-Reply-To: <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com>
Date: Fri, 30 Oct 2026 17:40:50 -0500
Cc: Ulf Hansson <ulfh@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CCF5CCC2-2C9F-4E5A-8550-B8C64CD7F404@manyhobbies.com>
References: <179318778660.81375.11263258280496155344@manyhobbies.com>
 <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX42Fyqr+Tof5x
 rqVhPO8azEg2A5LW2ESnHeokCLl9ntkDY7jC9hzq36RV7+owLm/MNys1xfWZ1rmBeJSqAQAbsCm
 4ForHBTbHjT5TVtmQWXv4aNaTSnT8lYFsV2iSDVwiLh06CaaUuedek/4JuVgoy7pulWNS/f1RCe
 hK/mU4vAJietBbZ6nxUmeXJ3DYE/vCpJ4Wpc3ZZxUwYhdRx13Pxd7gpip8NdiArrUJb/yIZCsAp
 WtB2QekCxNBYGC7TQQdVPc30kOPia8XDie22rcsFVaXfc9hdyuzqsk/ufZG9b8lGuqJOsykJJiB
 LX7GJ4XCbqmM0uU3JgcXIivalfeoTgwLuQHBopwDBz4PW4gg1GElRS5qXuF73Q=
X-Proofpoint-GUID: 2x_7z9kaaNiPlJQqNqi13Xatg90oQXIf
X-Authority-Info-Out: v=2.4 cv=d4X4CBjE c=1 sm=1 tr=0 ts=6ae51cff
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=w2OPf45SAAAA:8 a=EUspDBNiAAAA:8
 a=hnEzuQZJkBTHcMNEFcUA:9 a=QEXdDO2ut3YA:10 a=-iXIJKm6ftRzmWoHelNS:22
X-Proofpoint-ORIG-GUID: 2x_7z9kaaNiPlJQqNqi13Xatg90oQXIf
X-JNJ: AAAAAAABLs59V6KwCCAZC5NBGWHf2zFYri/plGG7y3+Q5gp7br6rJx6KqvTkp4DSxXlP9Y
 4KyLaml0R0O0APQwD/pokhEV11lMm43pO17KIoSAHnCWdXfByYanOXMdBVUKOMPyPyTX4f
 mD9ZRwOt5lfFSbj3N2pNQdHClNGOOFkVEWSL91FjXsUp3CGtNa+wiG367dfOxNl5QzPdqL
 zv6YH1ZGTI+pzIXwjgysQInFcKJRva735GA+2XFQR4Mc1x33mMzoEfp7ECXFyzw/Gbzb57
 TDaETMY+TwHB6cICBKFK6D+1wFQcfsVa3blQydPtRn+/WST9HtUURvW6h65wl9BqpqKwvM
 YO5rJDmbudm0fXKn9C0EGORe8L3WVvPUbcsWMTKcMoqUknjv9ctpiF7szqVkuKjHRFc1cM
 08aHV8/ouxjSzJXW206vujYn9k6Z6NuuWjZQFSzPaduK+tNQ1+nBM3hnSw4qF0rrFUITlj
 vqG24OcWeXxAWZi1hdW+skQCzFZslVuwQl6Jg26/KMZRe0dySP+qydZtVs2VbzG0MH+UVh
 cAgeBNXJx8nUKYt3iwx49D1jLHqC4rtA0vf4+QzXcDS0jw+A/gKx5C8plQpDiB+fELNDIG
 9ZnCeq2d9MEXIO7L0wZ1C5hSd7BoR6UJmMvsHwhzx4j0u7uNpRNCS4dgMcWXmMs7Kg5Zb5
 5HvXLPAPHfDXBWpj2isqLlAO1fg5WxFEUuyWQzYIietdqGxbmnQ0lGa5AmakX6BbIhFiXD
 BWqzhRglBxjdiofAYt5kGBb4trGtKqtOcx8+ry+WtrO9lyHVhTXnz6SeSFBREubZP/edF+
 6Ars9ZNUwTd+pl4v27foQN0na+N2aERZatj+q5cKpOx3zW27TnIGA1YtWlwy786V7/nlvy
 4me/MEBFYdV0LdWupRzdh9DR5aNBXhqxksI4+7mrv21dyPI6NXcT8XRyqsqvO+CD6dbk81
 b+VGAQYqH2fOEcBpnHN/kHQYGzXNkDRoxqm1KiUvisO3N6sgNdclInHx0sDoUhMCoyfVBq
 k7xaMDUb2/WHlwPNmbWhlftLr2hPjmC5jODv7n50eWHKTbH7JBnfkSPEJM4JEWiuslcWqm
 ZDIHYxExUlS6jfCssnp2DBmAnl5eYBp7dp7YazaDRhSJvNtXrAt6uY682eskHJexvGSd86
 qynpqTi+TxvMk5xw7aCclxToZi2YaOUtlTRCLVwLC30pDQkUP/1cjgXeWopUt1HUpEo7G6
 3SDS+nmgSFAGhFzqf/O1nleSavTVoS7DStDAEQzc5buucRzB0tYS5IeYFQFE2jk79vXVQR
 CqimGOzOvYGFIlVCDj0255vhUIQpA8Ixbsa+BTS3jak1zuwXWE23JG/9YBUzVg3lY8+tJY
 Ju2n1x/VKUCzmVdTsadlVSUOrY1hm+hC9cF6UeqXgWsRzj9viPm7S68l3+TA+b3t7WNyGx
 V+jBWQD0Rf8SduvoM3yfuwXRXW4554m5Xxz01EaRzlSXOiWzFCr17Of4MlrWxMjYrrK8sg
 X+8aLt9F0hWjqUCbEsBbyP+2G7Jf9jz9Fx1RLTftg0qF9yeG4XLMMGi/7ClNBqPKoVMRky
 tmE5oaO6LkuMySfOkGZuUNsg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_154107_869952_3B869FEB 
X-CRM114-Status: GOOD (  24.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> loop in there that times out. The question is then, under what
> circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> waiting for the SDIO card to release the busy indication on DAT0?

Yes. It's the first update after probe, from the MMC_POWER_UP set_ios:
  sunxi_mmc_oclk_onoff+0x17c/0x1a0
  sunxi_mmc_clk_set_rate+0x1c/0x2c8
  sunxi_mmc_set_ios+0xe4/0x144
  mmc_power_up.part.0+0x40/0x150
  mmc_start_host+0x90/0x9c
  mmc_add_host+0x6c/0xa0
  sunxi_mmc_probe+0x35c/0x478

STAS already reads 0x206 there, before anything has been sent to the
card; on good boots it's 0x106. So the card is holding DAT0 when Linux
takes over. These are warm boots from the vendor firmware and it
happens on roughly half of them.

The supply explanation in the commit message is wrong, sorry. The rails
are up ~20 ms later and the command is still pending at the 750 ms
timeout. =46rom then on every update times out until the controller is
reset. Rebinding with the card idle never hit it (0/20 tries).
I'll fix the commit message in v4.

Tam


> On Oct 30, 2026, at 8:48=E2=80=AFAM, Ulf Hansson =
<ulf.hansson@oss.qualcomm.com> wrote:
>=20
> On Wed, Oct 28, 2026 at 12:43=E2=80=AFPM Tam Do =
<tam.do@manyhobbies.com> wrote:
>>=20
>> If the clock-update command times out it stays pending in the
>> controller, and every later clock update times out as well, so the
>> card cannot be initialised until the next probe.
>>=20
>> This happens on an R16 board whose SDIO Wi-Fi holds DAT0 busy while
>> its supply comes up during the first clock update.
>=20
> It would be nice if you could elaborate a bit more on what goes on =
here.
>=20
> I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
> loop in there that times out. The question is then, under what
> circumstances are sunxi_mmc_oclk_onoff() being called when we are also
> waiting for the SDIO card to release the busy indication on DAT0?
>=20
>>=20
>> Reset the controller on timeout so the next attempt can succeed. This
>> runs sunxi_mmc_init_host() with the interrupt enabled for the first
>> time, so write REG_IMASK from sdio_imask under host->lock, as
>> sunxi_mmc_enable_sdio_irq() updates both under that lock.
>>=20
>> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found =
on Allwinner sunxi SoCs")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Tam Do <tam.do@manyhobbies.com>
>=20
> Kind regards
> Uffe
>=20
>> ---
>> v3: take host->lock only around the REG_IMASK write in
>>    sunxi_mmc_init_host(), not across the reset; v2 polled the reset =
on
>>    jiffies with interrupts off. The return value stays unchecked, as =
in
>>    sunxi_mmc_runtime_resume(): if the reset itself times out the
>>    controller is wedged either way.
>> v2: held host->lock across the reset (not posted)
>> v1: =
https://lore.kernel.org/all/179307312104.39863.12372814163472848752@manyho=
bbies.com/
>>=20
>> drivers/mmc/host/sunxi-mmc.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/drivers/mmc/host/sunxi-mmc.c =
b/drivers/mmc/host/sunxi-mmc.c
>> index fe4c0f6d73f3..55313780d06d 100644
>> --- a/drivers/mmc/host/sunxi-mmc.c
>> +++ b/drivers/mmc/host/sunxi-mmc.c
>> @@ -322,6 +322,7 @@ static int sunxi_mmc_reset_host(struct =
sunxi_mmc_host *host)
>>=20
>> static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
>> {
>> +       unsigned long flags;
>>        u32 rval;
>>=20
>>        if (sunxi_mmc_reset_host(host))
>> @@ -336,7 +337,9 @@ static int sunxi_mmc_init_host(struct =
sunxi_mmc_host *host)
>>        /* Maximum timeout value */
>>        mmc_writel(host, REG_TMOUT, 0xffffffff);
>>        /* Unmask SDIO interrupt if needed */
>> +       spin_lock_irqsave(&host->lock, flags);
>>        mmc_writel(host, REG_IMASK, host->sdio_imask);
>> +       spin_unlock_irqrestore(&host->lock, flags);
>>        /* Clear all pending interrupts */
>>        mmc_writel(host, REG_RINTR, 0xffffffff);
>>        /* Debug register? undocumented */
>> @@ -688,6 +691,7 @@ static int sunxi_mmc_oclk_onoff(struct =
sunxi_mmc_host *host, u32 oclk_en)
>>=20
>>        if (rval & SDXC_START) {
>>                dev_err(mmc_dev(host->mmc), "fatal err update clk =
timeout\n");
>> +               sunxi_mmc_init_host(host);
>>                return -EIO;
>>        }
>>=20
>> --
>> 2.39.5
>>=20



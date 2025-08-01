Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A848FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 21:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLPwcuI4ugiXwkjg0rvMLapTACGRc+nL6mhp+Zi3zRs=; b=OerY7TveSuHR9SskEV41UXF1ad
	5Dmr5Vmx4aCz4ppXaQvbbqBL4cwhf74QuEjoaKBmf8VLSKmxZWpsUidKLb2a16xcomdTGZq7clLqP
	PwzkbHwbseHfp8C/h8XrwsxUqUH/yBhxSbi6BHd/+MQMaJrsjl3gcXd18ck0brdV2+i2yTX7B0Heo
	li/+tG+TxL1DuZ5scCwh8RVbSZ+CETWrECI5nTx1qLJgcr2yxmOw4nI+07cOGYoEW0bkHGvViPbuJ
	hexnsBRlsCiCnKC0AmYxC4e4+CMl9gULsVN13/Qz4NNpd5k3fY9PNaeriNvh8L+fY2LSAPRy+EurM
	sEBVCkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhxFa-00000006pAC-2NNG;
	Fri, 01 Aug 2025 21:25:14 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhxCK-00000006ouZ-0o9g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 21:21:53 +0000
Message-ID: <12e12833-3c0f-4bf2-a758-25275b48ce0b@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1754083298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLPwcuI4ugiXwkjg0rvMLapTACGRc+nL6mhp+Zi3zRs=;
	b=eBXMmg4IgNgYoxpUUhPyxeDjTZe055ln/0r8qfcr287bdmPA5gekrn5JjOHhNCuuawYgHR
	+StGYDtgs7Mr08wWH4ECB/dbGugeuY5X72izeu+wci++KnIPTyhr6PmqEF0k5I1Q9qmzUa
	2r9eZCmuwmylDeRoXBHBNH3L6+gHjL2Q5WcTLnQSRUxRkoGNFD8lN9p2qkUp4K4RE017fw
	n6HqQgZr61p7zrxfr6LXZHOdOrGOQ4xNGKUauAc+Fc2476CFwlDx/twnh+hkurcOup/U7f
	RowjwMIw7YN76ZCXEG2QWilNFMDFHNadC62R/vqqAsIzMsKjQxD3H/vyD0tegQ==
Date: Fri, 1 Aug 2025 14:21:33 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] Input: stmpe-keypad - add STMPE1801 support
To: Sergey Larin <cerg2010cerg2010@mail.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210618145149.10136-1-cerg2010cerg2010@mail.ru>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Paul Sajna <sajattack@postmarketos.org>
In-Reply-To: <20210618145149.10136-1-cerg2010cerg2010@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_142152_383052_0C032866 
X-CRM114-Status: GOOD (  27.63  )
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

I've been heavily testing and relying on this patch for part of a 
device-specific-port to BlackBerry KEY2. This patch works great. I hope 
to submit my changes upstream when they are ready. Please let me know if 
there's anything I can do to help move this patch forward.

https://github.com/sdm660-mainline/linux/pull/97

On 6/18/21 7:51 AM, Sergey Larin wrote:
> This chip variant differs from others - it has different register
> map and swapped rows/columns.
>
> Signed-off-by: Sergey Larin <cerg2010cerg2010@mail.ru>
> ---
>   drivers/input/keyboard/stmpe-keypad.c | 108 ++++++++++++++++++++------
>   1 file changed, 85 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/input/keyboard/stmpe-keypad.c b/drivers/input/keyboard/stmpe-keypad.c
> index 7bf97285e30c..ed74578927a3 100644
> --- a/drivers/input/keyboard/stmpe-keypad.c
> +++ b/drivers/input/keyboard/stmpe-keypad.c
> @@ -13,7 +13,7 @@
>   #include <linux/input/matrix_keypad.h>
>   #include <linux/mfd/stmpe.h>
>   
> -/* These are at the same addresses in all STMPE variants */
> +/* These are at the same addresses in all STMPE variants, except 1801 */
>   #define STMPE_KPC_COL			0x60
>   #define STMPE_KPC_ROW_MSB		0x61
>   #define STMPE_KPC_ROW_LSB		0x62
> @@ -42,14 +42,15 @@
>   #define STMPE_KEYPAD_MAX_DEBOUNCE	127
>   #define STMPE_KEYPAD_MAX_SCAN_COUNT	15
>   
> -#define STMPE_KEYPAD_MAX_ROWS		8
> -#define STMPE_KEYPAD_MAX_COLS		8
> +#define STMPE_KEYPAD_MAX_ROWS		10
> +#define STMPE_KEYPAD_MAX_COLS		12
>   #define STMPE_KEYPAD_ROW_SHIFT		3
>   #define STMPE_KEYPAD_KEYMAP_MAX_SIZE \
>   	(STMPE_KEYPAD_MAX_ROWS * STMPE_KEYPAD_MAX_COLS)
>   
>   
>   #define STMPE1601_NUM_DATA	5
> +#define STMPE1801_NUM_DATA	5
>   #define STMPE2401_NUM_DATA	3
>   #define STMPE2403_NUM_DATA	5
>   
> @@ -67,6 +68,12 @@
>    * @max_rows: maximum number of rows supported
>    * @col_gpios: bitmask of gpios which can be used for columns
>    * @row_gpios: bitmask of gpios which can be used for rows
> + * @col_regs: registers for setting column pins
> + * @row_regs: registers for setting row pins
> + * @data_regs: registers for reading key data
> + * @ctrl_msb_reg: register for setting scan count
> + * @ctrl_lsb_reg: register for setting debounce time
> + * @cmd_reg: register for toggling scan mode
>    */
>   struct stmpe_keypad_variant {
>   	bool		auto_increment;
> @@ -77,6 +84,18 @@ struct stmpe_keypad_variant {
>   	int		max_rows;
>   	unsigned int	col_gpios;
>   	unsigned int	row_gpios;
> +
> +#define MAX_COL_REGS 3
> +#define MAX_ROW_REGS 3
> +#define MAX_DATA_REGS 5
> +
> +	u8 col_regs[MAX_COL_REGS];
> +	u8 row_regs[MAX_ROW_REGS];
> +	u8 data_regs[MAX_DATA_REGS];
> +	u8 ctrl_msb_reg;
> +	u8 ctrl_lsb_reg;
> +	u8 cmd_reg;
> +	bool read_inverted;
>   };
>   
>   static const struct stmpe_keypad_variant stmpe_keypad_variants[] = {
> @@ -88,6 +107,29 @@ static const struct stmpe_keypad_variant stmpe_keypad_variants[] = {
>   		.max_rows		= 8,
>   		.col_gpios		= 0x000ff,	/* GPIO 0 - 7 */
>   		.row_gpios		= 0x0ff00,	/* GPIO 8 - 15 */
> +		.col_regs		= { 0x60 },
> +		.row_regs		= { 0x62, 0x61 },
> +		.data_regs		= { 0x68, 0x69, 0x6a, 0x6b, 0x6c },
> +		.ctrl_msb_reg		= 0x63,
> +		.ctrl_lsb_reg		= 0x64,
> +		.cmd_reg		= 0x64,
> +		.read_inverted		= 0,
> +	},
> +	[STMPE1801] = {
> +		.auto_increment		= true,
> +		.num_data		= STMPE1801_NUM_DATA,
> +		.num_normal_data	= 3,
> +		.max_cols		= 10,
> +		.max_rows		= 8,
> +		.col_gpios		= 0x3ff00,	/* GPIO 8 - 17 */
> +		.row_gpios		= 0x000ff,	/* GPIO 0 - 7 */
> +		.col_regs		= { 0x31, 0x32 },
> +		.row_regs		= { 0x30 },
> +		.data_regs		= { 0x3a, 0x3b, 0x3c, 0x3d, 0x3e },
> +		.ctrl_msb_reg		= 0x33,
> +		.ctrl_lsb_reg		= 0x34,
> +		.cmd_reg		= 0x36,
> +		.read_inverted		= 1,
>   	},
>   	[STMPE2401] = {
>   		.auto_increment		= false,
> @@ -98,6 +140,13 @@ static const struct stmpe_keypad_variant stmpe_keypad_variants[] = {
>   		.max_rows		= 12,
>   		.col_gpios		= 0x0000ff,	/* GPIO 0 - 7*/
>   		.row_gpios		= 0x1f7f00,	/* GPIO 8-14, 16-20 */
> +		.col_regs		= { 0x60 },
> +		.row_regs		= { 0x62, 0x61 },
> +		.data_regs		= { 0x68, 0x69, 0x6a, 0x6b, 0x6c },
> +		.ctrl_msb_reg		= 0x63,
> +		.ctrl_lsb_reg		= 0x64,
> +		.cmd_reg		= 0x64,
> +		.read_inverted		= 0,
>   	},
>   	[STMPE2403] = {
>   		.auto_increment		= true,
> @@ -108,6 +157,13 @@ static const struct stmpe_keypad_variant stmpe_keypad_variants[] = {
>   		.max_rows		= 12,
>   		.col_gpios		= 0x0000ff,	/* GPIO 0 - 7*/
>   		.row_gpios		= 0x1fef00,	/* GPIO 8-14, 16-20 */
> +		.col_regs		= { 0x60 },
> +		.row_regs		= { 0x62, 0x61 },
> +		.data_regs		= { 0x68, 0x69, 0x6a, 0x6b, 0x6c },
> +		.ctrl_msb_reg		= 0x63,
> +		.ctrl_lsb_reg		= 0x64,
> +		.cmd_reg		= 0x64,
> +		.read_inverted		= 0,
>   	},
>   };
>   
> @@ -145,11 +201,11 @@ static int stmpe_keypad_read_data(struct stmpe_keypad *keypad, u8 *data)
>   	int i;
>   
>   	if (variant->auto_increment)
> -		return stmpe_block_read(stmpe, STMPE_KPC_DATA_BYTE0,
> +		return stmpe_block_read(stmpe, variant->data_regs[0],
>   					variant->num_data, data);
>   
>   	for (i = 0; i < variant->num_data; i++) {
> -		ret = stmpe_reg_read(stmpe, STMPE_KPC_DATA_BYTE0 + i);
> +		ret = stmpe_reg_read(stmpe, variant->data_regs[i]);
>   		if (ret < 0)
>   			return ret;
>   
> @@ -176,7 +232,9 @@ static irqreturn_t stmpe_keypad_irq(int irq, void *dev)
>   		u8 data = fifo[i];
>   		int row = (data & STMPE_KPC_DATA_ROW) >> 3;
>   		int col = data & STMPE_KPC_DATA_COL;
> -		int code = MATRIX_SCAN_CODE(row, col, STMPE_KEYPAD_ROW_SHIFT);
> +		int code = variant->read_inverted ?
> +			  MATRIX_SCAN_CODE(col, row, STMPE_KEYPAD_ROW_SHIFT)
> +			: MATRIX_SCAN_CODE(row, col, STMPE_KEYPAD_ROW_SHIFT);
>   		bool up = data & STMPE_KPC_DATA_UP;
>   
>   		if ((data & STMPE_KPC_DATA_NOKEY_MASK)
> @@ -265,7 +323,7 @@ static int stmpe_keypad_chip_init(struct stmpe_keypad *keypad)
>   {
>   	const struct stmpe_keypad_variant *variant = keypad->variant;
>   	struct stmpe *stmpe = keypad->stmpe;
> -	int ret;
> +	int ret, val, i;
>   
>   	if (keypad->debounce_ms > STMPE_KEYPAD_MAX_DEBOUNCE)
>   		return -EINVAL;
> @@ -281,33 +339,37 @@ static int stmpe_keypad_chip_init(struct stmpe_keypad *keypad)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = stmpe_reg_write(stmpe, STMPE_KPC_COL, keypad->cols);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = stmpe_reg_write(stmpe, STMPE_KPC_ROW_LSB, keypad->rows);
> -	if (ret < 0)
> -		return ret;
> +	val = keypad->cols;
> +	i = 0;
> +	do {
> +		ret = stmpe_reg_write(stmpe, variant->col_regs[i++], val & 0xff);
> +		if (ret < 0)
> +			return ret;
> +	} while ((val >>= 8) != 0);
>   
> -	if (variant->max_rows > 8) {
> -		ret = stmpe_set_bits(stmpe, STMPE_KPC_ROW_MSB,
> -				     STMPE_KPC_ROW_MSB_ROWS,
> -				     keypad->rows >> 8);
> +	val = keypad->rows;
> +	i = 0;
> +	do {
> +		ret = stmpe_reg_write(stmpe, variant->row_regs[i++], val & 0xff);
>   		if (ret < 0)
>   			return ret;
> -	}
> +	} while ((val >>= 8) != 0);
>   
> -	ret = stmpe_set_bits(stmpe, STMPE_KPC_CTRL_MSB,
> +	ret = stmpe_set_bits(stmpe, variant->ctrl_msb_reg,
>   			     STMPE_KPC_CTRL_MSB_SCAN_COUNT,
>   			     keypad->scan_count << 4);
>   	if (ret < 0)
>   		return ret;
>   
> -	return stmpe_set_bits(stmpe, STMPE_KPC_CTRL_LSB,
> -			      STMPE_KPC_CTRL_LSB_SCAN |
> +	ret = stmpe_set_bits(stmpe, variant->ctrl_lsb_reg,
>   			      STMPE_KPC_CTRL_LSB_DEBOUNCE,
> -			      STMPE_KPC_CTRL_LSB_SCAN |
>   			      (keypad->debounce_ms << 1));
> +	if (ret < 0)
> +		return ret;
> +
> +	return stmpe_set_bits(stmpe, variant->cmd_reg,
> +			      STMPE_KPC_CTRL_LSB_SCAN,
> +			      STMPE_KPC_CTRL_LSB_SCAN);
>   }
>   
>   static void stmpe_keypad_fill_used_pins(struct stmpe_keypad *keypad,


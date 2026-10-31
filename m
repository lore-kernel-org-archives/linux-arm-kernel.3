Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DD0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ebr5Nejd;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=EOQUwJKu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dTSpWgCuU+uPZLriefRpG7c7+1TKz+jm36CBK/vsWJk=; b=Ebr5NejdwMNtNX
	ECjWLKbs2fyI4ewZQhXveR5a94/9QRsblmHrCTzcz/jwzb8JRaCR7YEshXIA0tlF/FpiPAqkxfEDD
	ZtRjwTgGG0Fv/Mc/qmNHD5X19WvTuT+sqivjZ4GpLsLen5FbFzX/0M1nabOS1Fbz9Dz1FLpALFJy5
	2ioIc+U7srh1K5FLynreqzR4NJmcgsrK/7JEfAoerfJu2OwlReNOgqB3zDexWRwdZ6WyJ32Ih1R26
	yvFzikJejSeiMC7s8AQlLVZJxvD5Ue1udQaYgtnZPDm7fGItc0efwBfwhFK1nQ6H49rCcSpIic5Y2
	dXqCxbjfQM04tPTQNr+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCNA-0000000DVL2-2S43;
	Sat, 31 Oct 2026 16:56:04 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCN7-0000000DVKf-25yE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 16:56:03 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1471375c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793465760; x=1794070560; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dTSpWgCuU+uPZLriefRpG7c7+1TKz+jm36CBK/vsWJk=;
        b=EOQUwJKufRyjVGng/9b7phN4hZWtklnYCO0WQ6eqauXgqFIoK1zqUqqKbPjLs5qKTb
         Nhj027mK6VHeU8EeXxwi8DAcQcS+sZfA3+tfbwf2z68W6CafJ45Kq0FVUv7cD1S0aEoy
         7gV4HDaOcIit15cTCeikJxxlDihIJgTGXcH0hXkhzXatq4EEyZbeumpBzvM+o+aVsmEY
         jzUts9zBcIaLOdDajWpCRGF2NdE5hN3FUprLDghV65QTCWeEeV5pzr66R3MVO9kVNs/L
         NQRq4lg+S+KvfoNqV1//619AbUzbohwLCFZBlpwS3nJ0QITchIT9JK+jhZgiVLVObBcw
         UaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465760; x=1794070560;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTSpWgCuU+uPZLriefRpG7c7+1TKz+jm36CBK/vsWJk=;
        b=1E+i/n3kuHgKWrmhIjMvp8Qt51Uu+ZvNM15e/1dYSfJU/pl6A2VnNZpkMM1mcoIycz
         2cfnNfP5JwJpOLPDW9yFeDSzNilAnU0obL2jlWtr9t8s0LUhZPWvjgWHYnXA+0QalSWA
         alEHJxpLJMvavOtKEuX/SnB3ujV45LKESevoLol+ebVtQBnlD233Geoc+j/sGGLvQ5wS
         l16JCs+LDDdUWi9nK78QB0VntVt7JuufGF9ExVCaCT6eO/v6AgfwDXHK3RX7/1APMb1N
         TgQZt2uya7IiZQYFBD/NfYoT5M/Rw/TvuHIU7vSqMZaqAEsHNEtDLmmgStd/Y2jG/ZqE
         e3aw==
X-Gm-Message-State: AFq9FYLV+s5ScIF0eG7pzfwSz2JO4puyPuVo8bGCC+oqeVLGLZtEy88E
	LzFhHB5odxZGRUkWGzVon+UtD2WMwTADGwTnvWmfbuANu3Bbv/7nUJaIyHRrjhhddJw=
X-Gm-Gg: AYBFou1yZxdW6EFULMJkztVYW/scnMpCwCN31Lm5CExZrw2RKDM0EamArFZd5Wm750c
	D9LvaZzOofhjiJfCXNjyqlxILmUXM+5YUkmwcMuhPhgTz3LVdBC24daV9Q9BJ+OHx0pbtOsiL4b
	9dFL84+JrcHL6zrzwAnOowOTzLEAcJwmBauADWP1HV/uKho4ExW4XO9Dt41qtnt9cFkXT4X+Oju
	5WQLH6sFi9CygPNcJJaq6EpThzf0jWRLCh2/j14dtRb1IH7ZtjnGMsh4lK4gZGeW6Nt9RSTbLLf
	Ug1SCWVfYd/ERAHa39Mb8qah/qlxIpLfkxOqwb91TIP3c9giX3CjP+1x64MULG2k2qCiLbXuouI
	Qnw1xb+ebLqpoECNBiJUpOUkGwzxgUdEDWR1YMPdMsHiAJN7lF9iTmrlplAXDjrUrE9dUw8OovW
	7Ed1ElHHH7a5tHY91VfviHeZ9+v+sLIMJQkitq8ePLOi9lhzEICGnYO/irKaWFM80gwT8qkrwKB
	YCXGU73MNM6Jfa8LD8HbqCS82ulEXe5VTyyW+ZjYUJlYux5ErtbbK3hj4F69F1uqsPh1q8GMB9D
	2Y+zuwy+Vp/jLc2PekhEYyfPUcB4sw==
X-Received: by 2002:a05:701b:4517:10b0:185:fd0c:4585 with SMTP id a92af1059eb24-1ac5fb18de9mr7587298c88.33.1793465760211;
        Sat, 31 Oct 2026 09:56:00 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm17690437c88.15.2026.10.31.09.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 09:55:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 09:55:58 -0700
Message-Id: <DMJ6JVD0I6KI.2DKEVAB8RYTO4@nexthop.ai>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sasha Levin" <sashal@kernel.org>,
 "Siddarth Chilukuri" <siddarth@nexthop.ai>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] Revert "i2c: xiic: defer RX_FULL until all trailing
 bytes are in FIFO"
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>, "Michal Simek"
 <michal.simek@amd.com>, "Andi Shyti" <andi.shyti@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261008-i2c-xiic-block-read-nack-v2-1-76735ed0b0bf@nexthop.ai>
In-Reply-To: <20261008-i2c-xiic-block-read-nack-v2-1-76735ed0b0bf@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_095601_549989_4D8BD802 
X-CRM114-Status: GOOD (  41.33  )
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

On Thu Oct 8, 2026 at 6:01 PM PDT, Abdurrahman Hussain wrote:
> This reverts commit e6fe3ea04f0113fe4d47c03d76e03805a4768ca7.
>
> That commit raised the Rx FIFO threshold for an SMBus block read whose
> trailing bytes fit in the FIFO, on the grounds that firing RX_FULL with
> the last byte still in flight made xiic_read_rx() NACK, and so truncate,
> that byte. NACKing the last byte does not truncate it: it is how a
> master ends a read. The byte is still clocked in and is drained on the
> bytes_rem =3D=3D 0 path that follows, which also issues the STOP.
>
> What the higher threshold does instead is skip the bytes_rem =3D=3D 1
> branch, the only place that sets NO_ACK, so every trailing byte is now
> ACKed. Having had its last byte ACKed, the target goes on to drive the
> next one, and the STOP that follows lands in the middle of it.
>
> Some targets ride this out; others are left wedged until the next
> transactions clock them free. A TDK FS1412 fails the two transfers that
> follow any block read, so it never probes: pmbus reads MFR_ID as a block
> and then VOUT_MODE as a byte. A Renesas RAA228246 and one RAA228244 on
> the same controller fail the plain block read itself and the byte read
> after it.
>
> With commit b7e6df2f52ed ("i2c: xiic: preserve PEC byte length in SMBus
> block read setup") and commit 840d8acc8792 ("i2c: xiic: don't clobber
> msg->len to signal block-read completion") in place, PEC block reads
> pass at the original threshold. The PEC failures the reverted commit
> attributed to the threshold came from the bugs those two fix; all three
> were developed together against an ADM1266, which rides out the extra
> ACK, so the regression did not show.
>
> Twenty rounds per device of a block read and a PEC block read of MFR_ID,
> each followed by a byte read:
>
>                before                      after
>             block  PEC   byte after     block  PEC   byte after
>   FS1412    20/20  0/20  20/40 fail     20/20 20/20   0/40 fail
>   RAA228246  0/20 20/20  20/40 fail     20/20 20/20   0/40 fail
>   RAA228244  0/20 20/20  20/40 fail     20/20 20/20   0/40 fail
>
> A second RAA228244 and an Infineon XDPE1A2G5B passed every round before
> and after.
>
> Fixes: e6fe3ea04f01 ("i2c: xiic: defer RX_FULL until all trailing bytes a=
re in FIFO")
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Cc: stable@vger.kernel.org # v6.3+
> ---
> A follow-up to my xiic block-read series, now in 7.3-rc as
> b7e6df2f52ed, e6fe3ea04f01 and 840d8acc8792. The second of those
> stopped NACKing the final byte of a block read that fits in the Rx
> FIFO, which leaves some PMBus targets wedged for the next couple of
> transfers.
>
> Tested on a 6.12 kernel carrying that series, against an AXI IIC
> controller with an FS1412, RAA228244/RAA228246 and XDPE1A2G5B behind
> it, using plain and PEC block reads and the byte reads that follow.
>
> The same happens on a second board, where two of four ISL68225s behind
> the same AXI IIC core fail plain block reads and the transfer
> after them. A capture of SCL/SDA taken inside the FPGA shows the
> mechanism: after the last byte of an MFR_ID block read the master
> drives ACK, the target starts on the next byte with SDA low, and the
> STOP the master then attempts never appears, leaving SDA held low. With
> this change the last byte is NACKed and the STOP is clean, and all four
> pass.
>
> PEC block reads do not regress: 1000 PEC block reads of MFR_ID per
> device, each followed by a byte read, on the FS1412, both RAA parts, the
> XDPE1A2G5B and a further RAA228244 passed without a failure, both with
> this revert alone and with Siddarth's patch on top of it.
>
> With this change a block read ends with a NACK, and so with TX_ERROR,
> like any other read. That puts it in the window Siddarth's patch closes,
> where xiic_process() sees TX_ERROR before RX_FULL and resets the core
> even though the data is already in the Rx FIFO:
>
>   https://lore.kernel.org/linux-i2c/20261005-i2c-xiic-rx-fifo-v1-1-0177ac=
5f72d7@nexthop.ai/
>
> The two touch different functions and apply cleanly to v7.3-rc6 in
> either order.
> ---
> Changes in v2:
> - Revert e6fe3ea04f01 outright instead of moving the threshold back by
>   truncated), and with b7e6df2f52ed and 840d8acc8792 in place PEC block
>   reads pass at the original threshold. The code change is the same
>   single line as v1 minus its tail =3D=3D 1 branch, which could never run
>   (Siddarth, Sashiko): reads with fewer than two trailing bytes are
>   padded to SMBUS_BLOCK_READ_MIN_LEN first.
>   Sashiko review: https://sashiko.dev/#/patchset/20261008-i2c-xiic-block-=
read-nack-v1-1-94882af6e598%40nexthop.ai
> - Link to v1: https://patch.msgid.link/20261008-i2c-xiic-block-read-nack-=
v1-1-94882af6e598@nexthop.ai
>
> To: Michal Simek <michal.simek@amd.com>
> To: Andi Shyti <andi.shyti@kernel.org>
> To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> hand: that commit's premise was wrong (a NACKed last byte is not
> ---
>  drivers/i2c/busses/i2c-xiic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c
> index 5e397a7e63f6..76ef9c26ed57 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -569,11 +569,11 @@ static void xiic_smbus_block_read_setup(struct xiic=
_i2c *i2c)
>  			i2c->smbus_actual_len =3D 1 + rxmsg_len + pec_len;
>  		} else {
>  			/*
> -			 * All trailing bytes fit in the Rx FIFO. Defer RX_FULL
> -			 * until every one of them is buffered, so the drain
> -			 * takes xiic_read_rx()'s bytes_rem =3D=3D 0 path.
> +			 * All trailing bytes fit in the Rx FIFO. The widened
> +			 * condition above guarantees rxmsg_len + pec_len >=3D 2,
> +			 * so this cannot underflow.
>  			 */
> -			rfd_set =3D rxmsg_len + pec_len - 1;
> +			rfd_set =3D rxmsg_len + pec_len - 2;
>  			i2c->rx_msg->len =3D rxmsg_len + 1 + pec_len;
>  		}
>  		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
>
> ---
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> change-id: 20261007-i2c-xiic-block-read-nack-d2b735baddd3
>
> Best regards,
> --
> Abdurrahman Hussain <abdurrahman@nexthop.ai>

Hi Andi,

Gentle ping on this one. It missed 7.3, so v7.3 and v7.3.1 now ship
e6fe3ea04f01, and any pmbus device on xiic that reads a block (the
FS1412 above, for one) fails to probe. Could you take the revert
through i2c-fixes for 7.4-rc?

When you apply it, the stable hint should be

Cc: stable@vger.kernel.org # v7.3

rather than "# v6.3+". Sasha dropped e6fe3ea04f01 from the older stable
queues, so 7.3.y is the only stable branch that has it.

The patch still applies cleanly on current mainline. I can resend
against -rc1 if that's easier for you.

Thanks,
Abdurrahman



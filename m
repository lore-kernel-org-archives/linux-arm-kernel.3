Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480EBD7496A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=; b=uA3yN9NQMrmQpXKdm0LMMA4h1G
	KHLAzoymovfKCik3zbaNA8+hMvFk9+LN8IoEHgOGRhhYIKu1KdDKEqQye05JdtZZHa9t5p3uzsYu8
	/fFypAt0JzTqidfcqY8ttzWyw8Jc6pUAtRzmhj+kWa7uwwPB+aYuAUfxLakSBOR4VmSm9datx+TDJ
	bAGiKKOfTyghQXkBlwumG0qOlX9+M0/WDk92nDhQpN2b0NKHr/ANNdaHZs0pG70Djf1V76qU8k3xW
	Kji8JCXVq2t66o9yD1hWUwfNqBxWn/FOu+L81CsQX40ncKq67IUQVT1P3HxepfcX0K1dC75XKEN4Q
	4RM9vPcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWbf-00000009vDf-0nvU;
	Fri, 19 Dec 2025 09:17:03 +0000
Received: from mail.fontri.pl ([51.195.90.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWbc-00000009vAR-2KO0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:17:02 +0000
Received: by mail.fontri.pl (Postfix, from userid 1002)
	id E2294ADAB8; Fri, 19 Dec 2025 10:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fontri.pl; s=mail;
	t=1766135814; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=;
	h=Date:From:To:Subject:From;
	b=sfKqlV/ID+DramA7U7U0nC+WiIoDmRLNohKV/sfQbWe/Vz+sL1QbheukB6J8n4OFw
	 4Yc/jpQp2dApyzDYRKlt7ngkzuDH3S0VsB+A0UWNedAoREodmI0M7OqUTPV/v4IUTh
	 nR17EDCMdpkpjw016h7qsKZT768s3eEGhhj1ZKi6/+tLot3vkT9f0/UGi4RF7tWiUn
	 VBJ/wR7VXumFv2PQBts+SDlq8MlNuf+Xy86/BfGiuuac7DDD4M4cSoiZHttDW3bHGz
	 LghVwrfjNShpHHDzRB08vep5mMuBxIt3p3LAdxobArELDvqbX/ccLrZHRbg3tIqj2I
	 e5khIIKpSu5wQ==
Received: by mail.fontri.pl for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 09:15:36 GMT
Message-ID: <20251219084500-0.1.t3.6e9qq.0.6npl71zkkd@fontri.pl>
Date: Fri, 19 Dec 2025 09:15:36 GMT
From: =?UTF-8?Q?"=C5=BBaneta_K=C4=99dzierska"?= <zaneta.kedzierska@fontri.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Odbi=C3=B3r_w_paczkomacie_?=
X-Mailer: mail.fontri.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_011701_084423_19E1B951 
X-CRM114-Status: UNSURE (   2.54  )
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

Dzie=C5=84 dobry,

jako lider w us=C5=82ugach kurierskich w Polsce przygotowali=C5=9Bmy elas=
tyczne rozwi=C4=85zanie dla przedsi=C4=99biorc=C3=B3w.

Stworzyli=C5=9Bmy abonament =C5=82=C4=85cz=C4=85cy dostawy do Paczkomat 2=
4/7 oraz obs=C5=82ug=C4=99 kuriersk=C4=85 - jeden dostawca, jedna faktura=
 i przewidywalne, sta=C5=82e koszty.=20

Czy mog=C4=99 przedstawi=C4=87, co mo=C5=BCemy zaproponowa=C4=87 wzgl=C4=99=
dem Pa=C5=84stwa potrzeb?


Pozdrawiam
=C5=BBaneta K=C4=99dzierska


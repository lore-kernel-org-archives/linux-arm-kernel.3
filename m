Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9ABC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XClP9NrLHwO9fwyHdOh4Auz1PVrNeq/TxoOgtoY90n0=; b=1Ecurjy8r5w6fa
	eFciVRgc+mHOMl7+uBo3FnCYGL+oyjEoY810TC4aZZdHaF9btTgdc2/zZbL6EQy79Lm4R7EdKqhrW
	bYVIg5L9B6IIQT84Frx6hJW+2YDsvfDoXV81ao48oEj4/Pgl3O2EkSFb1yholvApzhd8SeZOpgPYM
	rqHryxCB1nQ5zkris2PCebmib91Y5YB4VMRz676nM/ky3MdU1wVGlwE2svJMSt1pyQpQSV8tvcZO4
	PCXZQObRN/AW6ixozazyUx6uyGDG/TsB8RLiC3DzhfEBNAyzfS9TpGHSz7MPYgiVneWwzu6Hg6nHB
	6Qxw0cOCAPJrX/ZfYCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bUV-00000004xYO-0Nms;
	Tue, 15 Apr 2025 08:17:59 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bKK-00000004vqS-1Z9D;
	Tue, 15 Apr 2025 08:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1744704420; x=1745309220; i=frank-w@public-files.de;
	bh=XClP9NrLHwO9fwyHdOh4Auz1PVrNeq/TxoOgtoY90n0=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qxHviqfsMTqZ1v990RvfJ9bRejEDPM0U7zJhNy/0Jz/s823RYlcXko39BUK7gDBk
	 ZhsuG+0A9/Y8gHs1taDTTVHTmEsa9qJFT5ASKK93XvH4uU+unsxSIAddfWIrRZK+6
	 zzohCcaWpcFIE0fdCHQbysIfaEHC+NfO5+j9DfW2RdGQURNPoCJdX0Vq6rxc5MzhR
	 5WN7K8KKXsA0jKHeZWFXybZxdZzY1B0wnx98xesCkFU4krFxaUITraweE3cyDUAIO
	 2uWpljywdxKA7muLP95/90h1xtnDfFIOfnszdYQ2n0Kbemr4xffaYsMmjzrQNqubR
	 8EGNdXS+0u518+F8xA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.148.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDkw-1t7P002D2u-00zhBt; Tue, 15
 Apr 2025 10:07:00 +0200
Date: Tue, 15 Apr 2025 10:07:01 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>
CC: Frank Wunderlich <linux@fw-web.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_arm64=3A_dts=3A_mediatek=3A_mt7?=
 =?US-ASCII?Q?988a-bpi-r4=3A_allow_hw_variants_of_bpi-r4?=
User-Agent: K-9 Mail for Android
In-Reply-To: <36fe0778-399a-4406-8516-54b968cd9073@collabora.com>
References: <20250412102109.101094-1-linux@fw-web.de> <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com> <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org> <36fe0778-399a-4406-8516-54b968cd9073@collabora.com>
Message-ID: <D7682B25-5BEF-46D1-A5FD-32D2AAF84EFF@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pa0vggB9lm+W0OPebuX0jYpX0yjxP/JpOSgB44M0VVskPM3DXyD
 9LogsfM/xLxC6PLuk+GPj2lPIj+CtvYDf3dqHiqwYp+1+ps1ov8I/5nqfuf8HkliFx46miv
 2ji2rqWXr0YnZB4RZbPRjU72vNPHSgRp7NBP74IVwtTQSLijfJwg3ShW2lHmIExQfDiS1mI
 S5jTXNRgwb52P104LTVSg==
UI-OutboundReport: notjunk:1;M01:P0:urNve2rXxnY=;yiVEU3OJuoqbJPWsNk3xJFPrslb
 6XgS7F0953EiOMGLEpbanm9yU02fg8ccgzjIi0iXX3k0JbeVJmatpmQ0OxrvwBozA9scOQwtB
 LeWsYLKdKmMC7QK5IiZDJQNu3aqlCFRUFY+GdZBJBsLsEq9w/NACKuhqn4MWuWQhUSWE7fOnC
 PrX5inR6etO5xToJwZsDUisQ+SMdnidz9banxNUDlKnRcmDN0vP+ejNP+wwc8oKTnRXC+NXT9
 VhJoIvkkjeS2MuibBDBFH/4kzziiCM2GBZTjU69EGpCtS/PSX6VYbL+BU4O0nnY5HBoqzbckv
 /SuHRxbQLbf9HWGHgwtpCVKhM/riHH0iT3IbtPmnBz0HeTf1QbykqDmdN4v3IqpXjbp3T5p8k
 1pLnRsKOlP+M1CKqTIqY274QCeAE9KeIGE6AIQMkEr3nLT2evNKLemkG/ne9+RNncC/WO0aPF
 KTkP0IS1TqjHtgKd6vXdxSaYbqzJ9wPHOu6/AES0HiIqEL+Y8lFR70PZfELIH7arD2RyKdl9J
 Igu0F9CtNCKZmcBVOgfHuTGrKHRE+lhZk229WhmKgNPhgEOFK5zHlNlPYPCvcRT5jA2U48rk0
 HZyOzDTdqWxeMA+lTTmoFKDHLFkKchhz15QjnMq9QKbxuWJYgOMp3cen6Hi72vZQwzaoQ2XBy
 b3+Emgoie2bcxIvittQuIGqQMHkhnHm/9Yd6KiChBPUnXGT7JbeYFbKSFj73RWQ10Kj+5u94F
 AnaTrqIQhYT6FQxGcpjPM3dNj39H/93cp5srg8MYx+6GnVOAcWfwLWsgjTUHDVHje08mkfMsN
 4cnJ+3fZHF2BYOHw4bVcJ7YnpC1F9XPX9+ryNE47Erez086ZTT6Mhyr9EqKFG68lKzlnjx4An
 dl2hTJSW/u5LJHj0Rlz1pB7ngcHAfcNq7akmimLdUPIloS9kk8PVl7tUo5ZqLQAx9rTrzcg8R
 Snh9QekEJwREWFzPX6WqGSWTUr78SXEjlTOiIZclYuq8ijLAqSBYJ8EZolMRaT+mOieEEsGYL
 JNEeMdgdjMG8YV14fJl1j/EalciKqiN9NPmtmKghF3ALIVD9V2Beu8E5CPA3L2osLQN5sd7lU
 YAKSO51USU4lq3J4/XaUzvSA5vbfh8MuX1LsbyYsvZHs16JkRtqPv1io+9WZuATW/2Rvx80zf
 8zuje60L1jI87s/w7Kr2LUbbF7KlbFDWF3NI8vZXAVGYOtTnAVvxQV2CCmdRMBZP3ToA8X9r7
 8dTnfIJrnnd2rqukxpcuof4UVfcsD3UJ8Za4ofC7FPScImpdXYFMXXwbeyy2hRET1f8RXe2E5
 BSxa8e4dkzAdAmFGiJc2WnHcm+H0ibda5TzgR9M5zfmOO8D3m0K+vMt/oAJNT8CjALXAOcHxu
 VXZMc66BXlRBdfnotXsGsbyJJCqA+cqwBBdpgz/Ae8MJ3IgBdCv0bvttpfExjDPiuz2kscm36
 kGEPDeYkQPSpHY6Ilqqq3Ml01/vHudSElaMy3TzjSMSrSZJrr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_010728_701480_29D658B3 
X-CRM114-Status: GOOD (  12.39  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 15=2E April 2025 09:36:43 MESZ schrieb AngeloGioacchino Del Regno <angel=
ogioacchino=2Edelregno@collabora=2Ecom>:
>Il 14/04/25 14:32, Daniel Golle ha scritto:
>> On Mon, Apr 14, 2025 at 11:27:23AM +0200, AngeloGioacchino Del Regno wr=
ote:
>>> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
>>>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>>>=20
>>>> Sinovoip has released other variants of Bananapi-R4 board=2E
>>>> The known changes affecting only the LAN SFP+ slot which is replaced
>>>> by a 2=2E5G phy with optional PoE=2E
>>>>=20
>>>> Just move the common parts to a new dtsi and keep differences (only
>>>> i2c for lan-sfp) in dts=2E

>>> This should at least have some different compatible, if not probably a=
lso a
>>> different model string - as it's a different device=2E
>>>=20
>>> 	compatible =3D "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt=
7988a";
>>=20
>> Imho it doesn't make sense to declare compatibility with the
>> "bananapi,bpi-r4" as the "bananapi,bpi-r4-2g5" is NOT compatible with t=
he
>> "bananapi,bpi-r4"=2E It's a different board and using firmware meant fo=
r the
>> "bananapi,bpi-r4-2g5" on the "bananapi,bpi-r4" (or vice versa) will res=
ult
>> in a non-working Ethernet port=2E
>>=20
>
>Is this device a BananaPi R4 variant, or is it a completely different dev=
ice?

The only difference is that sfp-lan is replaced by RJ45 socket with mt7988=
 internal phy=2E

>If this is a completely different device, then it's not even a BananaPi R=
4,
>otherwise this is compatible with BananaPi R4, with a small variation :-)

Sinovoip now announces a R4Pro with some more changes (e=2Eg=2E an externa=
l 2=2E5g switch),but we have no detailed shematic yet=2E It looks they also=
 plan a R4lite which is based on different SoC (afair mt7987),but this is f=
or sure different device (and so not using this bpi-r4=2Edtsi)=2E

But basicly all are named BPi-R4=2E I guess R4Pro will also get own dts as=
 too much changed=2E

>Cheers,
>Angelo


regards Frank

